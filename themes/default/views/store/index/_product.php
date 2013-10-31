<?php

/**
 * @var StoreProduct $data
 */
?>


		<?php echo CHtml::link('                            	<img src="uploads/category/'.$data->url.'.jpg" width="208" height="204" alt="" />
                            	<span>'. CHtml::encode($data->name) .'</span>', array('category/view', 'url'=>$data->url), array('class'=>'item')) ?>
