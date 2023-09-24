<?php

namespace App\Utilities;

use Illuminate\Pagination\LengthAwarePaginator;

class Paginator
{
    /**
     * @param $filter
     * @param $responseContent
     * @return LengthAwarePaginator
     */
    public static function getPaginator($filter, $responseContent): LengthAwarePaginator
    {
        $perPage = $filter->input('limit', 10);
        if ($filter->has('limit')) {
            $perPage = $filter->get('limit');
        }

        $currentPage = $filter->input('page', 1);
        if ($filter->has('page')) {
            $currentPage = $filter->get('page');
        }

        return new LengthAwarePaginator(
            collect($responseContent)->forPage($currentPage, $perPage),
            collect($responseContent)->count(),
            $perPage,
            $currentPage,
        );
    }

    /**
     * @param $filter
     * @param array $array
     * @return array
     */
    public static function getPaginatedResponse($filter, array $array): array
    {
        $perPage = 10;

        if ($filter->has('limit')) {
            $perPage = $filter->get('limit');
        }

        if ($filter->has('page')) {
            $page = $filter->get('page');
        } else {
            $page = $filter->input('page', 1);
        }

        $offset = ($page - 1) * $perPage;

        return array_slice($array, $offset, $perPage);
    }

}