<?php

namespace App\Traits;

trait SexType
{
    public function getSexTypes()
    {
        return array(
            'M' => trans('general.male'),
            'F' => trans('general.female'),
            'N' => trans_choice('general.others', 1),
        );
    }

    public function getSexByType($type)
    {
        $type = "";

        switch ($type) {
            case "M":
                $type = trans("general.male");
                break;
            case "F":
                $type = trans("general.female");
                break;
            case "N":
                $type = trans_choice("general.others", 1);
                break;

        }

        return $type;
    }
}
