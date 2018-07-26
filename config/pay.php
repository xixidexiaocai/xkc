<?php

return [
    'alipay' => [
        'app_id'         => '2016091200495316',
        'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApSIjpFQc5jz7pCXEentC6GhVPwE9vz25IzF2IeggAMDGd11JATEQ5OEMTz9y9ynnE/dnk2cc4+rD+r73I2fC76vijHvbP+TMX/qISB9yd5IaVIDrPvjoBocILY/rkvDebTB5MNYK2xCGv3kGNKnFuE0er+kV4eNz5sZnqYAKga+QUlhaMad64bJVe/K8Ajb5PJChsTViQnjuffEkGq+7Oer1B1xFoKciZRqSVVa2cuMKYF58TTKMcPTmqxzdjfSO46P837eaMnweIvNyNnZhUdYuFsYt1xSf7YKaVMasB/4yTUEOkeri4eiq3TIdkwfL400g9IXVjBIad1j/cUfDtQIDAQAB',
        'private_key'    => 'MIIEowIBAAKCAQEAt7LyoL09B72Ln57Yf7grMvhDzjZynLE8CyUnLq7K8XLK6l98rj+dv4SFvlzgZ96cEuu3tGfeblx6fv+hgPCm78MA/edcQNX0cqcjG663QW4keBm7j9d8alkmd22xYhXAnf72T4bsojrrIrKEbggH1u5UF8sKYEfVIwoeidjy/IRlc5YsHW0xrCN6FslYYjE82zky4FCcrUF6WqiWLXZ9xUtehgGyNzbQDKrMVU7tzGXFLSf6gXVIuyaAsWac4Rh+9YpvMCcgEmMplwDHJ4d5neSYm247h/ARtiViqA9w9uGkHQPufIXqEae9CelaPfMyB8OPIDIGyEPqq0fxDnSwZwIDAQABAoIBAQCU++0LsG7u+CtlKc8sxpFCpVdYx4/sxVGNOHSux9SQPimULB1StQWbbj+KRIk7tK+gKMy05AjiON6gYXL6wDKkAeOsCRgo/V1kH2m56dl2l328aiJUZs/g8Kzh73UNt9agTUg295azfFV3rpD5LEovZtuM8H9Z1uhloq9h3TI02UwodxBrxYptzQ2DvfhJRn6eqbLkhGJhSNRnxL/UqBcezzHEHrhfUNy9DOw5+U19v8ZJApMXOrbfYYj8qb1EHzWnL+rvIFROJoa0v4jaloi9B79JHCMVBvUf0YF9++iLOPF76vhLclZ1GroVzOT6g612T1emy04qIwDhqICaQlABAoGBANr5QoPmvkYYT0TU+/oDbw3XzweXLTopo2Wb4uBOHYZmEwNJAvQg2JynNTb2pe+KClKz+TrF0l9aN0PpswtcaOu39yjmFELJ6rZCOTaRArslmqOCDPemhZHtExEKzLJYQ/0jv/ndds/dzYYUwWO/R63xvaLPevMauG3rwEXeTUjBAoGBANbCv+Lr082VkLlqIJ1fOg3aEcV+0L26boGhhY7pLF4jsqaqf3P2ku4grGgtnz9Xt3CU4dwfIk3lXRZpcQQerDbjsbQvM60gbFQRFsvMxewmhhViTXqDCzOdk59fUL0LRB8+e/WXnB3dnUM1PPLqDYAblkUjY3DR1eBKMkXqUlsnAoGAORMjLTIlgiuv7ab+Dop6lcccZUQYO8LCnidlmUWDGJbeecq8BFnTW/GRQ0RCuA7o5emXGqSZUtU29nKhgmKRzm7i8zwVJ9ttXBgixYBCj/kbN2ccbihvRDvg7l48QHgVMJPy4/O/liqf+UTLq24eBs6tuRQPXfInBC+grBVnW4ECgYAgYEu9UgAkRiADU9SG5QxDelSjiXK+p5RxRoB0AwMFTixoo9uDB/EupQ5YxkfzrK2i8075eFgbljBqaIr5LAaaX8kyeMs5lmG+arUdFEniSAx+vMshZRATP/Y5WI07cq9aZnkZlTmb5wUGVMhTdqWCYqZM1gDvyTKNFaJul9zCkQKBgGMUwO4LoCm4J4Mj4UdwrkNqtHEGYSdmlrPl/XYjYIgZ+OvO5syBHSbrKXXi9IeyX1sihKj8TVIs0JozirHbOo8d6+yol4j7wq8TV2h6VELKkenATV4oimi/9N2RE9YmyLJ+0x7mV8cc5l+eWPYMUVIgDp4Rx7z62ya4hj+y4sOj',
        'log'            => [
            'file' => storage_path('logs/alipay.log'),
        ],
    ],

    'wechat' => [
        'app_id'      => '',
        'mch_id'      => '',
        'key'         => '',
        'cert_client' => '',
        'cert_key'    => '',
        'log'         => [
            'file' => storage_path('logs/wechat_pay.log'),
        ],
    ],
];