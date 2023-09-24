<?php

namespace App\Traits;

use App\Utilities\Info;
use Exception;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ConnectException;
use GuzzleHttp\Exception\RequestException;

trait SiteApi
{
    public static $base_uri = 'http://localhost:8042/';

    public static function apiRequest($method, $path, $extra_data = [])
    {
        self::$base_uri = env('API_URL');
        $client = new Client(['verify' => false, 'base_uri' => static::$base_uri]);

        $headers['headers'] = [
            'Authorization' => 'Basic ' . env('API_BASIC_AUTH'),
            'Accept'        => 'application/json',
            'Referer'       => app()->runningInConsole() ? config('app.url') : url('/'),
            'ProjectLaravel'  => version('short'),
            'Language'      => language()->getShortCode(),
            'Information'   => json_encode(Info::all()),
        ];

        $data = array_merge([
            'timeout' => 120,
            'referer' => true,
            'http_errors' => false,
        ], $extra_data);

        $options = array_merge($data, $headers);

        try {
            $response = $client->request($method, $path, $options);
        } catch (ConnectException | Exception | RequestException $e) {
            $response = $e;
        }

        return $response;
    }

    public static function getResponse($method, $path, $data = [], $status_code = 200)
    {
        $response = static::apiRequest($method, $path, $data);

        $is_exception = (($response instanceof ConnectException) || ($response instanceof Exception) || ($response instanceof RequestException));

        if (!$response || $is_exception || ($response->getStatusCode() != $status_code)) {
            return false;
        }

        return $response;
    }

    public static function getResponseData($method, $path, $data = [], $status_code = 200)
    {
        if (!$response = static::getResponse($method, $path, $data, $status_code)) {
            return [];
        }

        $body = json_decode($response->getBody());

        if (!is_object($body)) {
            return [];
        }

        return $body->data;
    }

    /**
     * @param $filter
     * @return string
     */
    public static function getQueryStudy($filter): string
    {
        $query = "{";

        if ($filter->get('patient_id')) {
            $query .= '"PatientID": "*' . $filter->get('patient_id') . '*",';
        }

        if ($filter->get('patient_name')) {
            $query .= '"PatientName": "*' . $filter->get('patient_name') . '*",';
        }

        if ($filter->get('patient_sex')) {
            $query .= '"PatientSex": "' . $filter->get('patient_sex') . '",';
        }

        if ($filter->get('patient_birth_date')) {
            $query .= '"PatientBirthDate": "' . str_replace('-', '', $filter->get('patient_birth_date')) . '",';
        }

        if ($filter->get('study_id')) {
            $query .= '"StudyID": "' . $filter->get('study_id') . '",';
        }

        if ($filter->get('study_description')) {
            $query .= '"StudyDescription": "' . $filter->get('study_description') . '",';
        }

        if ($filter->get('study_date')) {
            $query .= '"StudyDate": "' . str_replace('-', '', $filter->get('study_date')) . '",';
        }

        if ($filter->get('study_modality')) {
            $query .= '"ModalitiesInStudy": "' . $filter->get('study_modality') . '",';
        }

        $has_permission_view_all_studies = user()->allPermissions()->filter(function ($permission) {
            return $permission->name === 'read-studies-all';
        });

        if ($has_permission_view_all_studies->isEmpty()) {

            $institutions_names = user()->companies()->get()->map(function ($company) {
                return $company->institution_name;
            });

            $query .= '"InstitutionName": "' . $institutions_names->implode("\\\\") . '",';
        }

        if ($filter->get('accession_number')) {
            $query .= '"AccessionNumber": "' . $filter->get('accession_number') . '",';
        }

        $query .= ' "Other": ""';

        $query .= "}";

        return $query;
    }
}
