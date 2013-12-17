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

                            <div class="item_list">
                                <?php 
                                    if (isset($category) && $category->children()->count() > 0) { 
                                        if ($category->level == 2) {
                                            //$this->renderPartial('_category', array('manufacturer'=>$this->model, 'data'=>$data));
                                            foreach($category->children()->findAll() as $data) { ?>
                                                <a class="item" href="<?php echo $data->url ?>" style="width: 202px;" alt="">
                                                    <img src="/uploads/category/<?php echo $data->url ?>.jpg" width="202" height="200" alt="" />
                                                        <span><?php echo CHtml::encode($data->name) ?></span>
                                                </a>
                                        <?php } 
                                            } else { ?>
                                        <ul>
                                            <?php //foreach($category->children()->findAll() as $data) { ?>
                                            <?php foreach($category->descendants()->findAll() as $data) {
                                                $margin = ($data->level - 3) * 15; //вычислить отступ по уровню ?>
                                                <li style="margin-left: <?php echo $margin; ?>px">
                                                    <a href="<?php echo $data->url ?>"><?php echo CHtml::encode($data->name) ?></a>
                                                </li>
                                            <?php } ?>
                                        </ul>    
                                    <?php } } ?>
                                <div class="clr"></div>
                            </div>
                        </div>

                        <!--<form action="" class="filter">-->
                        <?php echo CHtml::form('', 'post', array('class'=>'filter')) ?>
                            <div class="line line2">
                                <div class="key_word">
                                    <label for="">Ключевое слово</label>
                                    <input type="text" value="<?php echo $filterData['word'] ?>" name="keyword"/>
                                </div>
                                <div class="range">
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
                                    <label for="">Сортировка: </label>
                                    <select id="sorter" name="sorter" onchange="applyCategorySorter(this)" class="sm">
                                        <option value="<?=Yii::app()->request->removeUrlParam('/store/category/view', 'sort')?>">---</option>
                                        <!--<option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'rating'))?>">по рейтингу</option>-->
                                        <!--<option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'rating.desc'))?>">Убыванию Рейтинга</option>-->
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'price'))?>">по цене ↓</option>
                                        <option value="<?=Yii::app()->request->addUrlParam('/store/category/view', array('sort'=>'price.desc'))?>">по цене ↑</option>
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
                                 function applyCategorySorter(el) {
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