<?php

/**
 * @var StoreProduct $data
 */
?>

                        	<span class="item prod_item">
								<?php
								if($data->mainImage)
									$imgSource = $data->mainImage->getUrl('208x204');
								else
									$imgSource = 'http://placehold.it/208x204';
								echo CHtml::link(CHtml::image($imgSource, $data->mainImageTitle), array('frontProduct/view', 'url'=>$data->url), array('class'=>'thumbnail'));
								?>
								<?php echo CHtml::link(CHtml::encode($data->name), array('frontProduct/view', 'url'=>$data->url), array('class'=>'name')) ?>
                                <span class="inf">Артикул: XXXX<br />Мощность - FFFF Вт<br />Высота - 50 см</span>
                                <span class="btm_pad">
                                	<?php if ($data->price > 0) : ?>
                                		<span class="price"><strong><?=$data->price?></strong> <?=Yii::app()->currency->main->symbol?></span>
                                	<?php endif; ?>
                                </span>
                            </span>
