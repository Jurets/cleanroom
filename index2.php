<?php

/*define('VERSION', '1.4.1');

error_reporting(0);

$yii=dirname(__FILE__).'/framework/yii.php';
$config=dirname(__FILE__).'/protected/config/main.php';

// remove the following lines when in production mode
 defined('YII_DEBUG') or define('YII_DEBUG', true);
 defined('YII_TRACE_LEVEL') or define('YII_TRACE_LEVEL', 3);

require $yii;
require 'protected/components/SWebApplication.php';

// Create application
Yii::createApplication('SWebApplication', $config)->run();
                                                              */


if (!$link = mysql_connect('localhost', 'u7757_chisto', 'qhH1z08!')) {
    echo 'Не удалось подключиться к mysql';
    exit;
}

if (!mysql_select_db('u7757239_chisto', $link)) {
    echo 'Не удалось выбрать базу данных';
    //exit;
} else {

    $sql = 'ALTER TABLE StoreAttribute ADD COLUMN is_kit TINYINT(1) NOT NULL DEFAULT 0';
    $result = mysql_query($sql, $link);

    if (!$result) {
        echo "Ошибка DB, запрос не удался\n";
        echo 'MySQL Error: ' . mysql_error();
        //exit;
    }
    mysql_close($link);    
}

?>