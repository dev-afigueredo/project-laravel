<?php

return [

    'report'                                => 'Laudo',
    'doctor_name'                           => 'Med.',
    'modality'                              => 'Mod.',
    'description'                           => 'Procedimento',
    'date'                                  => 'Dt. Estudo',
    'modality_studies'                      => 'Ser/Img',
    'institution'                           => 'Instituição',
    'age'                                   => 'Idade',
    'draft'                                 => 'Rascunho',

    'patient'               => [
        'id'                                => 'Pac. ID',
        'name'                              => 'Paciente',
        'sex_type'                          => 'Sexo',
        'birth_date'                        => 'Dt. Nasc.',
    ],

    'validation'            => [
        'required_report'                   => 'O Laudo é obrigatório',
    ],

    'error'                 => [
        'duplicate'                         => 'Esse exame já foi laudado por esse médico',
        'not_found'                         => 'Exame não localizado',
    ],

    'print'                 => [
        'patient_name'                      => 'Nome do Paciente',
        'code_patient'                      => 'Cód. Paciente',
        'doctor_request'                    => 'Médico Solicitante',
        'age'                               => 'Idade',
        'birth_date'                        => 'Data de Nascimento',
        'study_date'                        => 'Data do Exame',
        'info_report'                       => 'Laudo gerado no dia :date. Uma cópia digital se encontra disponível para consulta. Entre em contato caso precise desse documento em PDF.',
    ]

];
