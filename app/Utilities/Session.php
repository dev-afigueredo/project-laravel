<?php

namespace App\Utilities;

class Session
{
    /**
     * @param $filter
     * @param $type
     */
    public static function saveSessionFilter($filter, $type): void
    {
        switch ($type) {
            case 'patient':
                session(['queryParamsFilterPatient' => json_encode($filter->all())]);
                break;
            case 'study':
                session(['queryParamsFilterStudy' => json_encode($filter->all())]);
                break;
            case 'report_center':
                session(['queryParamsFilterReportCenter' => json_encode($filter->all())]);
                break;
        }
    }

    /**
     * @param $type
     * @return array
     */
    public static function getQueryParamsList($type): array
    {
        switch ($type) {
            case 'patient':
                return (array) json_decode(session('queryParamsFilterPatient'));
            case 'study':
                return (array) json_decode(session('queryParamsFilterStudy'));
            case 'report_center':
                return (array) json_decode(session('queryParamsFilterReportCenter'));
        }

        return [];
    }

}