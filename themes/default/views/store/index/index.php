<?php

/**
 * Site start view
 */
?>

<h1>Категории</h1>
                <div class="rounded_wr">
                	<div class="rounded">
                    	<div class="item_list">

	<?php
		foreach($popular as $p)
			$this->renderPartial('_product', array('data'=>$p));
	?>
                        	<div class="clr"></div>
                        </div>
                    </div>
                </div>
<?php
    $model = Page::model()
            ->published()
            ->withUrl('indexmain')
            ->find(array(
                'limit'=>1
            ));
?>

<!--<h1 class="has_background"><?php echo $model->title; ?></h1>-->
<!--<p>
    <?php echo $model->short_description; ?>
</p>-->
<p>
    <?php echo $model->full_description; ?>
</p>

