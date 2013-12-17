<?php

/**
 * Category view
 * @var $this CategoryController
 * @var $model StoreCategory
 * @var $provider CActiveDataProvider
 * @var $categoryAttributes
 */

// Set meta tags
$this->pageTitle = ($this->model->meta_title) ? $this->model->meta_title : $this->model->name;
$this->pageKeywords = $this->model->meta_keywords;
$this->pageDescription = $this->model->meta_description;

$this->breadcrumbs[] = $this->model->name;

?>

<div class="breadcrumbs">
    <?php
        $this->widget('zii.widgets.CBreadcrumbs', array(
            'links'=>$this->breadcrumbs,
        ));
    ?>
</div>


<div class="rounded_wr">
    <div class="rounded">

        <div class="text text2">
            <h1><?php echo CHtml::encode($this->model->name); ?></h1>
            <?php if(!empty($this->model->description)): ?>
                <div>
                    <?php echo $this->model->description ?>
                </div>
            <?php endif ?>
        </div>

        <div class="item_list">

                <?php
                    foreach($popular as $p)
                        $this->renderPartial('_category', array('manufacturer'=>$this->model, 'data'=>$p));
                ?>
            <div class="clr"></div>
        </div>
    </div>
</div>
<?php
    Yii::import('application.modules.pages.models.Page');
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