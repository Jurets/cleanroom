<?php

/**
 * @var StoreProduct $data
 */
 $model = StoreProduct::model()->findByPk($data->id);
?>

                        	<span class="item prod_item" style="margin: 4px 2px;width: 203px;">
								<?php
								if($data->mainImage)
									$imgSource = $data->mainImage->getUrl('208x204');
								else
									$imgSource = 'http://placehold.it/208x204';
								echo CHtml::link(CHtml::image($imgSource, $data->mainImageTitle, array('width'=>179,'height'=>176)), array('frontProduct/view', 'url'=>$data->url), array('class'=>'thumbnail'));
								?>
								<?php echo CHtml::link(CHtml::encode($data->name), array('frontProduct/view', 'url'=>$data->url), array('class'=>'name')) ?>
                                <span class="inf">&nbsp;Артикул: <?=$data->sku;?>
                                    <?php
                                    if($model->getEavAttributes())
                                    {
                                        $this->widget('application.modules.store.widgets.SAttributesTableRenderer', array(
                                            'model'=>$model,
                                            'limitRows'=>2,
                                            'separator'=>' - ',
                                            'htmlOptions'=>array(
                                                'class'=>'attributes'
                                            ),
                                        ));
                                    }
                                    ?>
                                </span>
                                <span class="btm_pad">
                                	<?php if ($data->price > 0) : ?>
                                		<span class="price"><strong><?=$data->price?></strong> <?=Yii::app()->currency->main->symbol?></span>
                                	<?php endif; ?>
                                </span>
                            </span>
