<?php

	Yii::import('application.modules.store.components.SCompareProducts');
	Yii::import('application.modules.store.models.wishlist.StoreWishlist');
    
    $assetsManager = Yii::app()->clientScript;
    $assetsManager->registerCoreScript('jquery');
    $assetsManager->registerCoreScript('jquery.ui');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><?php echo CHtml::encode($this->pageTitle) ?></title>
	<meta charset="UTF-8"/>
	<meta name="description" content="<?php echo CHtml::encode($this->pageDescription) ?>">
	<meta name="keywords" content="<?php echo CHtml::encode($this->pageKeywords) ?>">
	<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/reset.css">

	<link href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/jquery-ui-1.10.0.custom.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/jquery.selectBox.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/jcarousel.css" rel="stylesheet" type="text/css" />

    <link href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<?php echo Yii::app()->theme->baseUrl ?>/assets/css/product.css" rel="stylesheet" type="text/css" />

<!--	<script type="text/javascript" src="<?php // echo Yii::app()->theme->baseUrl ?>/assets/js/jquery-1.9.0.min.js"></script>-->
	<script type="text/javascript" src="<?php  echo Yii::app()->theme->baseUrl ?>/assets/js/jquery-ui-1.10.0.custom.min.js"></script>
	<script type="text/javascript" src="<?php  echo Yii::app()->theme->baseUrl ?>/assets/js/jquery.selectBox.min.js"></script>
	<script type="text/javascript" src="<?php  echo Yii::app()->theme->baseUrl ?>/assets/js/jquery.cycle.lite.js"></script>
	<script type="text/javascript" src="<?php  echo Yii::app()->theme->baseUrl ?>/assets/js/jquery.jcarousel.min.js"></script>

	<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl ?>/assets/js/site.js"></script>
</head>
<body>

<div class="wrapper">


	<div class="header">
    	<div class="wrap">
            <a class="logo" href="/"><img src="/themes/default/assets/images/logo.png" width="171" height="86" /></a>
            
            <?php echo CHtml::form($this->createUrl('/store/category/search'), 'post', array('class'=>'search')) ?>
                <!--<input type="text" value="" name="q" id="searchQuery">-->
                <?php echo CHtml::textField('q', '', array('placeholder'=>'Поиск товаров', 'id'=>"searchQuery")) ?>
                <!--<button type="submit">Поиск</button>-->
                <input type="submit" value="">
                <div class="clear"></div>
            <?php echo CHtml::endForm() ?>

            <div class="slogan">
            	<div class="slogan1"><div class="lbg"></div><div class="rbg"></div><p><strong>Чисто</strong>та в <strong>пром</strong>ышленных масштабах!</p></div>
                <p class="slogan2">продажа уборочной техники</p>
            </div>

            <div class="hd_pad1">
                <p class="tel">
                <!--8 800 795-62-90<br />8 800 795-62-90</p>
                <p class="tel">+7 (926) 336-08-12<br><br>-->
                <?php echo Yii::app()->db->createCommand("SELECT `value` FROM `systemsettings` WHERE `key` = 'editorTelephone'")->queryScalar(); ?>
                </p>
                <p class="worktime">Работаем с 9:00  до 21:00  без выходных</p>
            </div>

            <ul id="menu_top">
			<?php
				$this->widget('zii.widgets.CMenu2', array(
					'items'=>array(
                        array('label'=>Yii::t('core', 'Главная'), 'url'=>Yii::app()->createAbsoluteUrl()),
						/*array('label'=>Yii::t('core', 'Помощь'), 'url'=>array('/pages/pages/view', 'url'=>'help'),),
						array('label'=>Yii::t('core', 'Как сделать заказ'), 'url'=>array('/pages/pages/view', 'url'=>'how-to-create-order')),
						array('label'=>Yii::t('core', 'Гарантия'), 'url'=>array('/pages/pages/view', 'url'=>'garantiya')),
						array('label'=>Yii::t('core', 'Доставка и оплата'), 'url'=>array('/pages/pages/view', 'url'=>'dostavka-i-oplata')),*/
                        array('label'=>Yii::t('core', 'О компании'), 'url'=>array('/pages/pages/view', 'url'=>'about')),
                        array('label'=>Yii::t('core', 'Сервис'), 'url'=>array('/pages/pages/view', 'url'=>'service')),
                        array('label'=>Yii::t('core', 'Оплата и доставка'), 'url'=>array('/pages/pages/view', 'url'=>'dostavka-i-oplata')),
                        array('label'=>Yii::t('core', 'Контакты'), 'url'=>array('/pages/pages/view', 'url'=>'contacts')),
					),
				));
			?>
            </ul>
         </div>
    </div>



    <div class="content">
    	<div class="wrap">

<!--            <div class="slider_wr">
            	<ul id="slider">
                	<li><img src="/themes/default/assets/images/slide01.jpg" width="960" height="323" alt="" /></li>
                    <li><img src="/themes/default/assets/images/slide02.jpg" width="960" height="323" alt="" /></li>
                </ul>
            </div>-->

            <div class="lc">

              <h3 class="title">Категории</h3>

            <?php
                Yii::import('application.modules.store.models.StoreCategory');
                $items = StoreCategory::model()->findByPk(1)->asCMenuArray('4');
                if(isset($items['items'])) {
                    $this->widget('application.extensions.mbmenu.MbMenu',array(
                        'cssFile'=>Yii::app()->theme->baseUrl.'/assets/css/menu.css',
//                        'htmlOptions'=>array('id'=>'side_menu'),
                        'items'=>$items['items'],
                        'id'=>'side_menu',
                        'activateParents'=>false
                        )
                    );
                }
            ?>

              <div class="banner"><a href=""><img src="/themes/default/assets/images/banner01.jpg" width="198" height="298" alt="" /></a></div>

            </div>
            <div class="rc">
				<?php echo $content; ?>
            </div>
            <div class="clear"></div>
        </div>
    </div>

    <div class="footer">
    	<div class="wrap">

            <p class="copyrights">© 2013</p>
            <p class="web_dev">Партнеры: 
                <!--<a href="">website.com</a>  <a href="">website.com</a>  <a href="">website.com</a>  -->
                <?php echo Yii::app()->db->createCommand("SELECT `value` FROM `systemsettings` WHERE `key` = 'editorPartners'")->queryScalar(); ?>
            </p>
            <div class="clr"></div>
        </div>
    </div>

</div>

</body>
</html>