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
/*$this->widget('application.extensions.fancybox.EFancyBox', array(
	'target'=>'a.thumbnail',
));*/

?>
<style type="text/css">
    table.attributes > tbody > tr > td:nth-child(2) {
        width: 2px;
    }
</style>

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
                        <?php  // Main product image
                            if($model->mainImage)
                                echo CHtml::link(CHtml::image($model->mainImage->getUrl('336x317', 'resize'), $model->mainImage->title), $model->mainImage->getUrl(), array('class'=>'thumbnail'));
                            else
                                echo CHtml::link(CHtml::image('http://placehold.it/340x250'), '#', array('class'=>'thumbnail'));
                        ?>
                        <div class="sm_imgs jcarousel-skin-default">
                            <div class="jcarousel " id="jcarousel">
                                <ul>
                                <?php // Display additional images
                                    foreach($model->imagesNoMain as $image) {
                                        echo CHtml::openTag('li', array('class'=>'span2'));
                                        echo CHtml::link(CHtml::image($image->getUrl('160x120'), $image->title), $image->getUrl(), array('class'=>'thumbnail'));
                                        echo CHtml::closeTag('li');
                                    }
                                ?>
                                </ul>
                            </div>
                            <a class="car_btn lbtn" href="#" onclick="$('#jcarousel').jcarousel('scroll', '-=1'); return false;"></a>
                            <a class="car_btn rbtn" href="#" onclick="$('#jcarousel').jcarousel('scroll', '+=1'); return false;"></a>
                        </div>
                    </div>
                    <div class="flr">
                      
                        <?php echo CHtml::form(array('/orders/cart/add'), 'post', array('class'=>'item_form')) ?>
                            <h1><?php echo CHtml::encode($model->name); ?></h1>
                                    <?php
                                    if($model->getEavAttributes())
                                    {
                                        $this->widget('application.modules.store.widgets.SAttributesTableRenderer', array(
                                            'model'=>$model,
                                            'limitRows'=>3,
                                            'separator'=>':  ',
                                            'htmlOptions'=>array(
                                                'class'=>'attributes',
                                                'style'=>'margin-top:20px;',
                                            ),
                                        ));
                                    }
                                    ?>
                                    </br>
<!--                            <div class="colors">
                                <p style="margin-left: 3px;">Цвета:</p>
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
                            </div>-->
                            
                            <?php if ($model->price > 0) { ?>
                                <p class="price">Цена: 
                                    <span><?php echo StoreProduct::formatPrice($model->toCurrentCurrency()).' '.Yii::app()->currency->active->symbol; ?></span>
                                </p>
                                <div style="clear: both;font-size: 16px">
                                    <?php 
                                    if($model->appliedDiscount)
                                        echo '<span style="color:red; "><s>'.$model->toCurrentCurrency('originalPrice').' '.Yii::app()->currency->active->symbol.'</s></span>';
                                    ?>
                                </div>
                            <?php } else { ?>
                                <span class="btn2" style="float: left;">
                                    <span>
                                        <a href="<?php echo Yii::app()->createAbsoluteUrl('feedback') ?>" style="text-decoration: none;">Запросить цену</a>
                                    </span>
                                </span>
                                <!--<span style="overflow: hidden;"></span>-->
                            <?php } ?>
                            
                            
                            <div class="errors" id="productErrors"></div>
                            
                            <!-- <div class="actions">
                            <?php
                                echo CHtml::hiddenField('product_id', $model->id);
                                echo CHtml::hiddenField('product_price', $model->price);
                                echo CHtml::hiddenField('use_configurations', $model->use_configurations);
                                echo CHtml::hiddenField('currency_rate', Yii::app()->currency->active->rate);
                                echo CHtml::hiddenField('configurable_id', 0);
                                echo CHtml::hiddenField('quantity', 1);

                                /*if($model->isAvailable)
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

                                echo CHtml::endForm();*/
                            ?>

                            <div class="silver_clean silver_button">
                                <button title="<?=Yii::t('core','Сравнить')?>" onclick="return addProductToCompare(<?php echo $model->id ?>);"><span class="icon compare"></span>Сравнить</button>
                            </div>

                            <div class="silver_clean silver_button">
                                <button title="<?=Yii::t('core','В список желаний')?>" onclick="return addProductToWishList(<?php echo $model->id ?>);"><span class="icon heart"></span>Список желаний</button>
                            </div> -->
                            <!--
                            <div class="line">
                                <div class="spinner_box">
                                    <label for="">К-во:</label>
                                    <input type="text" value="1" class="spinner" />
                                </div>
                                
                                <span class="btn2"><span><input type="button" value="В корзину" /></span></span>
                                
                                <div class="clr"></div>
                            </div>  -->
                        <?php echo CHtml::endForm(); ?>
                        
                    </div>
                    <div class="clr"></div>
                </div>
                
                <div class="item_inf">
                    <h3><?php echo Yii::t('StoreModule.core', 'Описание товара'); ?></h3>
                    <p><?php echo $model->short_description; ?></p>
                    <p><?php echo $model->full_description; ?></p>
                    
                    <h3><?php echo Yii::t('StoreModule.core', 'Характеристики товара'); ?></h3>
                    <?php
                        if($model->getEavAttributes())
                        {
                            $this->widget('application.modules.store.widgets.SAttributesTableRenderer', array(
                                'model'=>$model,
                                'htmlOptions'=>array(
                                    'class'=>'attributes'
                                ),
                            ));
                        }
                    ?>
                    
                    <?php
                        $isShow = false;
                        foreach($model->getEavAttributes() as $attrName => $val){
                            $modelAttr = StoreAttribute::model()->findByAttributes(array('name'=>$attrName));
                            if($modelAttr->is_kit) $isShow = true;
                        }
                        ?>
                        
                    <?php                             
                        if($isShow)
                        {
                        ?>
                            <h3><?php echo Yii::t('StoreModule.core', 'Комплектация'); ?></h3>
                    <?php
                               
                            $this->widget('application.modules.store.widgets.SAttributesTableRenderer', array(
                                'model'=>$model,
                                'is_kit'=>1,
                                'htmlOptions'=>array(
                                    'class'=>'attributes'
                                ),
                            ));
                        }                         
                     ?>
                    <div class="item_list3">
                        <h3><?php echo Yii::t('StoreModule.core', 'С этим товаром обычно покупают'); ?>:</h3>
                        <?php if($model->relatedProductCount) {
                                $this->renderPartial('_related', array('model'=>$model)/*, true*/);
                            }
                        //$this->renderPartial('_configurations', array('model'=>$model)); ?>
                        <div class="clr"></div>
                    </div>
                    
                </div>
                
            </div>
            
	        <?php
		        /*$tabs = array();

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
		        ');*/
	        ?>
    </div>    
        
</div>

