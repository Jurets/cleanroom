<?php
/**
 * Product view
 * @var StoreProduct $model
 * @var $this Controller
 */

// Set meta tags
$this->pageTitle = ($model->meta_title) ? $model->meta_title : $model->name;
$this->pageKeywords = $model->meta_keywords;
$this->pageDescription = $model->meta_description;

// Register main script
Yii::app()->clientScript->registerScriptFile($this->module->assetsUrl.'/product.view.js', CClientScript::POS_END);
Yii::app()->clientScript->registerScriptFile($this->module->assetsUrl.'/product.view.configurations.js', CClientScript::POS_END);

// Create breadcrumbs
if($model->mainCategory)
{
	$ancestors = $model->mainCategory->excludeRoot()->ancestors()->findAll();

	foreach($ancestors as $c)
		$this->breadcrumbs[$c->name] = $c->getViewUrl();

	// Do not add root category to breadcrumbs
	if ($model->mainCategory->id != 1)
		$this->breadcrumbs[$model->mainCategory->name] = $model->mainCategory->getViewUrl();
}

// Fancybox ext
$this->widget('application.extensions.fancybox.EFancyBox', array(
	'target'=>'a.thumbnail',
));

?>

    <div class="breadcrumbs">
        <?php
            $this->widget('zii.widgets.CBreadcrumbs', array(
                'links'=>$this->breadcrumbs,
            ));
        ?>
    </div>

    <div class="rounded_wr">


        <div class="rounded pad">
            
            <div class="item_det">
                <div class="top_pad">
                    <div class="fll">
                        <a href="" class="big_img">
                            <!--<img src="images/big_img01.jpg" width="336" height="317" alt="" />-->
                            <?php  // Main product image
                                if($model->mainImage)
                                    echo CHtml::link(CHtml::image($model->mainImage->getUrl('340x250', 'resize'), $model->mainImage->title), $model->mainImage->getUrl(), array('class'=>'thumbnail'));
                                else
                                    echo CHtml::link(CHtml::image('http://placehold.it/340x250'), '#', array('class'=>'thumbnail'));
                            ?>
                        </a>
                        <div class="sm_imgs jcarousel-skin-default">
                            <div class="jcarousel " id="jcarousel">
                                <!--<ul>
                                    <li><a href="images/big_img01.jpg"><img src="images/sm_img01.jpg" width="96" height="94" alt=""/></a></li>
                                    <li><a href="images/big_img02.jpg"><img src="images/sm_img02.jpg" width="96" height="94" alt=""/></a></li>
                                    <li><a href="images/big_img01.jpg"><img src="images/sm_img01.jpg" width="96" height="94" alt=""/></a></li>
                                    <li><a href="images/big_img02.jpg"><img src="images/sm_img02.jpg" width="96" height="94" alt=""/></a></li>
                                </ul>-->
                                <?php // Display additional images
                                    foreach($model->imagesNoMain as $image) {
                                        echo CHtml::openTag('li', array('class'=>'span2'));
                                        echo CHtml::link(CHtml::image($image->getUrl('160x120'), $image->title), $image->getUrl(), array('class'=>'thumbnail'));
                                        echo CHtml::closeTag('li');
                                    }
                                ?>
                            </div>
                            <a class="car_btn lbtn" href="#" onclick="$('#jcarousel').jcarousel('scroll', '-=1'); return false;"></a>
                            <a class="car_btn rbtn" href="#" onclick="$('#jcarousel').jcarousel('scroll', '+=1'); return false;"></a>
                        </div>
                    </div>
                    <div class="flr">
                        <?php echo CHtml::form(array('/orders/cart/add'), 'post', array('class'=>'item_form')) ?>
                        <h1><?php echo CHtml::encode($model->name); ?></h1>
                        <p class="type"> (Уборочные тележки и инвентарь)</p>
                        <p>
                            Длина в разложенном состоянии: 170 см <br />Ширина: 70 см <br />Вес: 30 кг <br />Объем: min. 1,02 м3 <br />Высота: от 750 мм
                        </p>
                        <!--<form action="" class="item_form">-->
                            <div class="colors">
                                <p>Цвета:</p>
                                <div class="line">
                                    <input type="button" style="background:#e0160c;" class="color" value=""/>
                                    <input type="button" style="background:#025bbb;" class="color" value=""/>
                                    <input type="button" style="background:#28752a;" class="color" value=""/>
                                    <input type="button" style="background:#f7d202;" class="color" value=""/>
                                    <input type="button" style="background:#8848fc;" class="color" value=""/>
                                    <input type="button" style="background:#15bdc3;" class="color" value=""/>
                                    <input type="button" style="background:#dbdbdb;" class="color" value=""/>
                                    <div class="clr"></div>
                                </div>
                            </div>
                            <p class="price">Цена: <span><?php echo StoreProduct::formatPrice($model->toCurrentCurrency()); ?></span></p>
                            <div class="line">
                                <div class="spinner_box">
                                    <label for="">К-во:</label>
                                    <input type="text" value="1" class="spinner" />
                                </div>
                                <span class="btn2"><span><input type="button" value="В корзину" /></span></span>
                                <div class="clr"></div>
                            </div>
                        <!--</form>-->
                        <?php echo CHtml::endForm(); ?>
                        
                    </div>
                    <div class="clr"></div>
                </div>
                
                <div class="item_inf">
                       <h3>Описание товара: </h3>
                    <p>Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. </p>
                    <h3>Характеристики товара</h3>
                    <table>
                        <tbody>
                            <tr>
                                <td>Производитель</td><td>Skil</td>
                            </tr>
                            <tr>
                                <td>Модель</td><td>001AA</td>
                            </tr>
                            <tr>
                                <td>Тип</td><td>дрель / шуруповерт</td>
                            </tr>
                            <tr>
                                <td>Патрон</td><td>быстрозажимной</td>
                            </tr>
                            <tr>
                                <td>Количество скоростей</td><td>2</td>
                            </tr>
                            <tr>
                                <td>Скорость</td><td>№ 1 • 0 об/мин 400 об/мин ; № 2 • 0 об/мин 1100 об/мин </td>
                            </tr>
                            <tr>
                                <td>Максимальный момент</td><td>28 Н*м</td>
                            </tr>
                        </tbody>
                    </table>
                    <h3>Комплектация</h3>
                    <table>
                        <tbody>
                            <tr>
                                <td>Производитель</td><td>Skil</td>
                            </tr>
                            <tr>
                                <td>Модель</td><td>001AA</td>
                            </tr>
                            <tr>
                                <td>Тип</td><td>дрель / шуруповерт</td>
                            </tr>
                            <tr>
                                <td>Патрон</td><td>быстрозажимной</td>
                            </tr>
                            <tr>
                                <td>Количество скоростей</td><td>2</td>
                            </tr>
                            <tr>
                                <td>Скорость</td><td>№ 1 • 0 об/мин 400 об/мин ; № 2 • 0 об/мин 1100 об/мин </td>
                            </tr>
                            <tr>
                                <td>Максимальный момент</td><td>28 Н*м</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="item_list3">
                        <h3>С этим товаром обычно покупают:</h3>
                        <a href="" class="item first">
                            <img src="images/item_img11.jpg" width="159" height="149" alt="" />
                            <span>Мойки высокого <br />давления</span>
                        </a>
                        <a href="" class="item">
                            <img src="images/item_img11.jpg" width="159" height="149" alt="" />
                            <span>Мойки высокого <br />давления</span>
                        </a>
                        <a href="" class="item">
                            <img src="images/item_img11.jpg" width="159" height="149" alt="" />
                            <span>Мойки высокого <br />давления</span>
                        </a>
                        <div class="clr"></div>
                    </div>
                    
                </div>
                
            </div>
            
    </div>    





	<div class="images">
		<div class="image_row">
			<div class="main">
				<?php
					// Main product image
					if($model->mainImage)
						echo CHtml::link(CHtml::image($model->mainImage->getUrl('340x250', 'resize'), $model->mainImage->title), $model->mainImage->getUrl(), array('class'=>'thumbnail'));
					else
						echo CHtml::link(CHtml::image('http://placehold.it/340x250'), '#', array('class'=>'thumbnail'));
				?>
			</div>
		</div>
		<div class="additional">
			<ul>
			<?php
			// Display additional images
			foreach($model->imagesNoMain as $image)
			{
				echo CHtml::openTag('li', array('class'=>'span2'));
				echo CHtml::link(CHtml::image($image->getUrl('160x120'), $image->title), $image->getUrl(), array('class'=>'thumbnail'));
				echo CHtml::closeTag('li');
			}
			?>
			</ul>
		</div>
	</div>

	<div class="info">
		<?php echo CHtml::form(array('/orders/cart/add')) ?>

		<h1><?php echo CHtml::encode($model->name); ?></h1>

		<?php $this->renderPartial('_configurations', array('model'=>$model)); ?>

		<div class="errors" id="productErrors"></div>

		<div style="clear: both;font-size: 16px">
			<?php
			if($model->appliedDiscount)
				echo '<span style="color:red; "><s>'.$model->toCurrentCurrency('originalPrice').' '.Yii::app()->currency->active->symbol.'</s></span>';
			?>
		</div>

		<div class="price">
			<span id="productPrice"><?php echo StoreProduct::formatPrice($model->toCurrentCurrency()); ?></span>
			<?php echo Yii::app()->currency->active->symbol; ?>
		</div>

		<div class="actions">
			<?php
				echo CHtml::hiddenField('product_id', $model->id);
				echo CHtml::hiddenField('product_price', $model->price);
				echo CHtml::hiddenField('use_configurations', $model->use_configurations);
				echo CHtml::hiddenField('currency_rate', Yii::app()->currency->active->rate);
				echo CHtml::hiddenField('configurable_id', 0);
				echo CHtml::hiddenField('quantity', 1);

				if($model->isAvailable)
				{
					echo CHtml::ajaxSubmitButton(Yii::t('StoreModule.core','Купить'), array('/orders/cart/add'), array(
						'dataType' => 'json',
						'success'  => 'js:function(data, textStatus, jqXHR){processCartResponse(data, textStatus, jqXHR)}',
					), array(
						'id'=>'buyButton',
						'class'=>'blue_button'
					));
				}
				else
				{
					echo CHtml::link('Сообщить о появлении', '#', array(
						'onclick' => 'showNotifierPopup('.$model->id.'); return false;',
					));
				}

				echo CHtml::endForm();
			?>

			<div class="silver_clean silver_button">
				<button title="<?=Yii::t('core','Сравнить')?>" onclick="return addProductToCompare(<?php echo $model->id ?>);"><span class="icon compare"></span>Сравнить</button>
			</div>

			<div class="silver_clean silver_button">
				<button title="<?=Yii::t('core','В список желаний')?>" onclick="return addProductToWishList(<?php echo $model->id ?>);"><span class="icon heart"></span>Список желаний</button>
			</div>
		</div>
		<div class="desc"><?php echo $model->short_description; ?></div>
		<div class="desc"><?php echo $model->full_description; ?></div>
	</div>

	<div style="clear:both;"></div>

	<?php
		$tabs = array();

		// EAV tab
		if($model->getEavAttributes())
		{
			$tabs[Yii::t('StoreModule.core', 'Характеристики')] = array(
				'content'=>$this->renderPartial('_attributes', array('model'=>$model), true
			));
		}

		// Comments tab
		$tabs[Yii::t('StoreModule.core', 'Отзывы').' ('.$model->commentsCount.')'] = array(
			'id'=>'comments_tab',
			'content'=>$this->renderPartial('comments.views.comment.create', array(
				'model'=>$model,
			), true));

		// Related products tab
		if($model->relatedProductCount)
		{
			$tabs[Yii::t('StoreModule.core', 'Сопутствующие продукты').' ('.$model->relatedProductCount.')'] = array(
				'id'=>'related_products_tab',
				'content'=>$this->renderPartial('_related', array(
					'model'=>$model,
				), true));
		}

		// Render tabs
		$this->widget('zii.widgets.jui.CJuiTabs', array(
			'id'=>'tabs',
			'tabs'=>$tabs
		));

		// Fix tabs opening by anchor
		Yii::app()->clientScript->registerScript('tabSelector', '
			$(function() {
				var anchor = $(document).attr("location").hash;
				var result = $("#tabs").find(anchor).parents(".ui-tabs-panel");
				if($(result).length)
				{
					$("#tabs").tabs("select", "#"+$(result).attr("id"));
				}
			});
		');
	?>
</div>
