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

                        <form action="" class="filter">
                        	<div class="line line2">

								<?php
//									$this->widget('application.modules.store.widgets.filter.SFilterRenderer', array(
//										'model'=>$this->model,
//										'attributes'=>$this->eavAttributes,
//									));
								?>
                            	<div class="clr"></div>
                            </div>
                        </form>


						<div class="item_list">

								<?php
									$this->widget('zii.widgets.CListView', array(
										'dataProvider'=>$provider,
										'ajaxUpdate'=>false,
										'template'=>'{items} {pager} {summary}',
										'itemView'=>'_product',
										'sortableAttributes'=>array(
											'name', 'price'
										),
									));
								?>

						</div><!-- catalog_with_sidebar end -->
				</div>
			</div>