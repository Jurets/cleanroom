<?php

/**
 * Category view
 * @var $this CategoryController
 * @var $model StoreCategory
 * @var $provider CActiveDataProvider
 * @var $categoryAttributes
 */
DebugBreak();
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
                        $this->renderPartial('_category', array('data'=>$p));
                ?>
            <div class="clr"></div>
        </div>
    </div>
</div>

<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>

