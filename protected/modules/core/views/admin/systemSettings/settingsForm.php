<?php

$themes=Yii::app()->themeManager->themeNames;
$themes=array_combine($themes, $themes);

function titleRow($title)
{
	return '
	<div class="row">
		<label>&nbsp;</label>
		<h3>'.$title.'</h3>
	</div>
	';
}

return array(
	'id'=>'systemSettingsForm',
	'showErrorSummary'=>true,
	'enctype'=>'multipart/form-data',
	'elements'=>array(
		'main'=>array(
			'type'=>'form',
			'title'=>Yii::t('CoreModule.admin', 'Настройки'),
			'elements'=>array(
				'core_siteName'=>array('type'=>'text'),
				'core_productsPerPage'=>array(
					'type'=>'text',
					'hint'=>Yii::t('CoreModule.admin', 'Вы можете указать несколько значений разделяя их запятой. Например: 10,20,30'),
				),
				'core_productsPerPageAdmin'=>array('type'=>'text'),
				'core_theme'=>array(
					'type'=>'dropdownlist',
					'items'=>$themes
				),
				titleRow('Настройки WYSIWYG редактора'),
				'core_editorTheme'=>array(
					'type'=>'dropdownlist',
					'items'=>array(
						'compant'  => Yii::t('CoreModule.admin', 'Компактная'),
						'normal'   => Yii::t('CoreModule.admin', 'Стандартная'),
						'complete' => Yii::t('CoreModule.admin', 'Полная'),
						'maxi'     => Yii::t('CoreModule.admin', 'Максимальная')
					)
				),
				'core_editorHeight'     =>  array('type'=>'text'),
                'core_editorAutoload'   =>  array('type'=>'checkbox'),
                'core_editorPartners'   =>  array('type'=>'SRichTextarea'),
                'core_editorTelephone'  =>  array('type'=>'SRichTextarea'),
                'images_main_banner'    =>  array('type'=>'text'),
                titleRow('Настройки слайдера'),
                'core_slider01'    =>  array('type'=>'text', 'label'=>'Слайд №1'),
                'core_slider02'    =>  array('type'=>'text', 'label'=>'Слайд №2'),
                'core_slider03'    =>  array('type'=>'text', 'label'=>'Слайд №3'),
                'core_slider04'    =>  array('type'=>'text', 'label'=>'Слайд №4'),
                'core_slider05'    =>  array('type'=>'text', 'label'=>'Слайд №5'),
                'core_slider06'    =>  array('type'=>'text', 'label'=>'Слайд №6'),
				'core_slider07'    =>  array('type'=>'text', 'label'=>'Слайд №7'),
			)
		),
		'images'=>array(
			'type'     => 'form',
			'title'    => Yii::t('CoreModule.admin', 'Изображения'),
			'elements' => array(
				'images_path'               => array('type'=>'text'),
				'images_thumbPath'          => array('type'=>'text'),
				'images_url'                => array('type'=>'text'),
				'images_thumbUrl'           => array('type'=>'text'),
				'images_maxFileSize'        => array(
					'type'=>'text',
					'hint'=>Yii::t('CoreModule.admin', 'Укажите размер в байтах.')
				),
				'images_maximum_image_size' => array(
					'type'=>'text',
					'hint'=>Yii::t('CoreModule.admin', 'Изображения превышающие этот размер, будут изменены.')
				),
				titleRow('Водяной знак'),
				'images_watermark_active' => array(
					'type'=>'checkbox',
				),
				'images_watermark_image' => array(
					'type'=>'file',
				),
				'<div class="row">
				<label></label>
				'.$this->model->renderWatermarkImageTag().'
				</div>',
				'images_watermark_position_vertical' => array(
					'type'=>'dropdownlist',
					'items'=>$this->model->getImageVerticalPositions()
				),
				'images_watermark_position_horizontal' => array(
					'type'=>'dropdownlist',
					'items'=>$this->model->getImageHorizontalPositions()
				),
				'images_watermark_opacity' => array(
					'type'=>'text'
				),
			)
		)
	)
);