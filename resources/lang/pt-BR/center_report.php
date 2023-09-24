<?php

return [

    'center'                                => 'Central de Laudo',
    'doctor_name'                           => 'Med.',
    'modality'                              => 'Mod.',
    'description'                           => 'Procedimento',
    'date'                                  => 'Dt. Estudo',
    'modality_studies'                      => 'Ser/Img',
    'reports'                               => 'Laudos',
    'select_doctor'                         => 'Selecionar Médico do Laudo',
    'select_medical_record'                 => 'Selecionar Prontuário',
    'medical_record'                        => 'Prontuário Médico',

    'patient'               => [
        'id'                                => 'Pac. ID',
        'name'                              => 'Paciente',
        'sex_type'                          => 'Sexo',
        'birth_date'                        => 'Dt. Nasc.',
    ],

    'filter'                => [
        'modality'                          => 'Mod.',
        'date_study'                        => 'Data do Estudo',

        'patient'           => [
            'name'                          => 'Nome Paciente',
            'id'                            => 'Paciente ID',
            'sex_type'                      => 'Sexo',
            'birth_date'                    => 'Dt. Nasc.',
        ]
    ],

    'tooltip'               => [
        'doctor'                            => 'Médico',
        'has_report'                        => 'Possui notificação para Laudo',
        'has_indication_clinical'           => 'Possui indicação clínica',
        'edit_report'                       => 'Editar Laudo',
        'report_print_or_download'          => 'Indicação se Laudo já foi impresso ou baixado',
        'create_report'                     => 'Criar Laudo',
        'print_pdf'                         => 'Imprimir Laudo - PDF',
        'lock'                              => '',
    ],

    'error'                 => [
        'duplicate'                         => 'Esse médico já foi adicionado',
        'attach'                            => 'A imagem do prontuário é obrigatório ou está inválido',
        'invalid_image'                     => 'O arquivo deve conter uma imagem',
    ],

];
