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

// Create breadcrumbs
$ancestors = $this->model->excludeRoot()->ancestors()->findAll();

foreach($ancestors as $c)
	$this->breadcrumbs[$c->name] = $c->getViewUrl();

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
                            <!--<ul>
                                <li><a href="">Кабельные поломоечные машины (230 В)</a></li>
                                <li><a href="">Аккумуляторные поломоечные машины</a></li>
                                <li><a href="">Поломоечные машины с сиденьем для оператора</a></li>
                                <li><a href="">Поломоечные машины колесничного типа с местом для оператора</a></li>
                                <li><a href="">Поломоечные машины для чистки эскалаторов</a></li>
                            </ul>-->

                            <div class="item_list">

                                    <?php //DebugBreak();
                                        if (isset($category) && $category->children()->count() > 0)
                                            foreach($category->children()->findAll() as $p)
                                                $this->renderPartial('_category', array('manufacturer'=>$this->model, 'data'=>$p));
                                    ?>
                                <div class="clr"></div>
                            </div>
                        </div>

                        <!--<form action="" class="filter">-->
                        <?php echo CHtml::form('', 'post', array('class'=>'filter')) ?>
                            <div class="line line2">
                                <div class="key_word">
                                    <label for="">Ключевое слово</label>
                                    <input type="text" value="" name="keyword"/>
                                </div>
                                <div class="range">
<!--                                    <label for="">Стоимость  от:</label>
                                    <input type="text" value="" name="min_price" />
                                    <label for="">до:</label>
                                    <input type="text" value="" name="max_price"/>-->
                                    <?php
//                                            $this->widget('application.modules.store.widgets.filter.SFilterRenderer', array(
//                                                'model'=>$this->model,
//                                                'attributes'=>$this->eavAttributes,
//                                                'view'=>'simplefilter'
//                                            ));
                                     ?>
<label for="">Стоимость  от:</label>
<?php echo CHtml::textField('minprice', (isset($_GET['minprice'])) ? (int)$this->getCurrentMinPrice():null ) ?>
<label for="">до:</label>
<?php echo CHtml::textField('maxprice', (isset($_GET['maxprice'])) ? (int)$this->getCurrentMaxPrice():null ) ?>
                                    <select class="sm dontchangethis" name="currency" id="sdfsdafdsa">
                                        <option value="2">руб</option>
                                        <option value="1">usd</option>
                                    </select>
                                </div>
                                <input type="submit" class="btn" value="искать" />
                                <div class="clr"></div>
                            </div>
                            <div class="line">
                                <div class="sort">
                                    <label for="">Сортировать по: </label>
                                    <select id="sorter" name="sorter" onchange="applyCategorySorter(this)" class="sm">
                                        <option value="<?=Yii::app()->request->removeUrlParam('/store/category/view', 'sort')?>">---</option>
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'rating'))?>">Рейтингу</option>
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'rating.desc'))?>">Убыванию Рейтинга</option>                                        
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'price'))?>">Сначала Дешовые</option>
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'price.desc'))?>">Сначала Дорогие</option>
                                    </select>
                                </div>
                                <?php
                                    $limits=array(Yii::app()->request->removeUrlParam('/store/category/view', 'per_page')  => $this->allowedPageLimit[0]);
                                    array_shift($this->allowedPageLimit);
                                    foreach($this->allowedPageLimit as $l)
                                        $limits[Yii::app()->request->addUrlParam('/store/category/view', array('per_page'=> $l))]=$l;
                                 ?>
                                <p class="size">Показывать по:    
                                <?php
                                     foreach($limits as $key => $val){
                                         echo '<a href="javascript:void(0);" onclick="foo(\''.$key.'\');">'.$val.'</a>';
                                     }
                                 ?>
                                 <script type="">
                                 function foo(url){
                                     window.location = url;
                                 }
                                 function applyCategorySorter(el)
{
    window.location = $(el).val();
}
                                 </script>
                                <p class="items_num">Товаров: <span><?=$provider->totalItemCount?></span></p>
                                <div class="clr"></div>
                            </div>
                        <!--</form>-->
                        <?php echo CHtml::endForm() ?>


						<div class="item_list">

								<?php
									$this->widget('zii.widgets.CListView', array(
										'dataProvider'=>$provider,
										'ajaxUpdate'=>false,
										'template'=>'{items} <div class="clear"></div> <div class="fl_c pager"><div class="fl_c1">{pager}</div></div>',
										'itemView'=>$itemView,
										'sortableAttributes'=>array(
											'name', 'price'
										),
                                        'cssFile'=>false,
                                        'pagerCssClass'=>'fl_c2',
                                        'pager'=>array(
                                            'previousPageCssClass'=>'prev-chisto',
                                            'nextPageCssClass'=>'next-chisto',
                                            'hiddenPageCssClass'=>'',
                                            'internalPageCssClass'=>'pbtn-chisto',
                                            'selectedPageCssClass'=>'active',
                                            'firstPageCssClass'=>'hidden',
                                            'lastPageCssClass'=>'hidden',
                                            'nextPageLabel'=>'',
                                            'prevPageLabel'=>'',
                                            'header'=>'',
                                            'htmlOptions'=>array(
                                                'class'=>'',
                                            )
                                        )
//                                        'pagerCssClass'=>'chistopager',
									));
								?>

						</div><!-- catalog_with_sidebar end -->
				</div>
			</div>