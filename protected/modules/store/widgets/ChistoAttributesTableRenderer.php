<?php

/**
 * Render product attributes table.
 * Basically used on product view page.
 * Usage:
 *     $this->widget('application.modules.store.widgets.SAttributesTableRenderer', array(
 *        // SProduct model
 *        'model'=>$model,
 *         // Optional. Html table attributes.
 *        'htmlOptions'=>array('class'=>'...', 'id'=>'...', etc...)
 *    ));
 */
class ChistoAttributesTableRenderer extends SAttributesTableRenderer
{

	/**
	 * Render attributes table
	 */
	public function run()
	{
//        DebugBreak();
		$this->_attributes = $this->model->getEavAttributes();
        
        foreach($this->_attributes as $attrName => $val){
            $modelAttr = StoreAttribute::model()->findByAttributes(array('name'=>$attrName));
            if($this->is_kit){
                if(!$modelAttr->is_kit) unset($this->_attributes[$attrName]);
            } else {
                if($modelAttr->is_kit) unset($this->_attributes[$attrName]);
            }
        }

		$data = array();
		foreach($this->getModels() as $model)
			$data[$model->title] = $model->renderValue($this->_attributes[$model->name]);

		if(!empty($data))
		{
			echo CHtml::openTag('table', $this->htmlOptions);
            $count = 1;
            $countData = count($data);
			foreach($data as $title=>$value)
			{
//                DebugBreak();
				echo CHtml::openTag('tr');
				echo '<td>'.CHtml::encode($title).'</td>';
//                echo '<td style="width:24px;"></td>';
//                if(count($data) - $countData >= 3){
//                    echo '<td colspan="2" style="width:24px;text-align:right;">'.CHtml::encode($value).'</td>';
//                }else{
//                    echo '<td style="width:40px;"></td>';
//				    echo '<td style="width:24px;text-align:right;">'.CHtml::encode($value).'</td>';
//                }
                echo '<td style="width:100px;text-align:right;">'.CHtml::encode($value).'</td>';
				echo CHtml::closeTag('tr');
                if($this->limitRows > 0){
                    if($this->limitRows === $count) break;
                    $count++;
                }
                $countData--;
			}
			echo CHtml::closeTag('table');
		}
	}
}
