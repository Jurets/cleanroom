<?php

/**
 * Site start view
 */
?>

<h1 style="font-weight: bold;font-size: 20px;">Категории</h1>
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

<p>
    <?php echo $model->full_description; ?>
</p>

