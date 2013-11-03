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
                            <ul>
                            	<li><a href="">Кабельные поломоечные машины (230 В)</a></li>
                                <li><a href="">Аккумуляторные поломоечные машины</a></li>
                                <li><a href="">Поломоечные машины с сиденьем для оператора</a></li>
                                <li><a href="">Поломоечные машины колесничного типа с местом для оператора</a></li>
                                <li><a href="">Поломоечные машины для чистки эскалаторов</a></li>
                            </ul>
                        </div>

                        <form action="" class="filter">
                            <div class="line line2">
                                <div class="key_word">
                                    <label for="">Ключевое слово</label>
                                    <input type="text" value="" name="key_word"/>
                                </div>
                                <div class="range">
                                    <label for="">Стоимость  от:</label>
                                    <input type="text" value="" name="min_price" />
                                    <label for="">до:</label>
                                    <input type="text" value="" name="max_price"/>
                                    <select class="sm" name="currency" id="">
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
                                    <select name="" id="" class="sm">
                                        <option value="1">Рейтингу</option>
                                        <option value="2">Рейтингу 2</option>
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
                                 </script>
                                <p class="items_num">Товаров: <span><?=$provider->totalItemCount?></span></p>
                                <div class="clr"></div>
                            </div>
                        </form>


						<div class="item_list">

								<?php
									$this->widget('zii.widgets.CListView', array(
										'dataProvider'=>$provider,
										'ajaxUpdate'=>false,
										'template'=>'{items} {pager} {summary}',
										'itemView'=>$itemView,
										'sortableAttributes'=>array(
											'name', 'price'
										),
									));
								?>

						</div><!-- catalog_with_sidebar end -->
				</div>
			</div>