<?php

class ManufacturerController extends Controller
{
	/**
	 * @var StoreManufacturer
	 */
	public $model;

	/**
	 * @var array
	 */
	public $allowedPageLimit;

	/**
	 * Sets page limits
	 *
	 * @return bool
	 */
	public function beforeAction($action)
	{
		$this->allowedPageLimit=explode(',',Yii::app()->settings->get('core', 'productsPerPage'));
		return true;
	}

	/**
	 * Display products by manufacturer
	 *
	 * @param $url
	 * @throws CHttpException
	 */
	public function actionIndex($url)
	{//DebugBreak();
        $this->model = StoreManufacturer::model()->findByAttributes(array('url'=>$url));
        if (!$this->model)
            throw new CHttpException(404, Yii::t('StoreModule.core', 'Производитель не найден.' . $url));
        
        $categories = $this->getManufacturerCategories($this->model->id, 12);
        $this->render('categories', array(
            'popular' => $categories,
        ));
	}
    
    /**
     * @param $limit
     * @return array
     */
    protected function getManufacturerCategories($manufacturer_id, $limit)
    {
        $condition = 'exists (  
                select * from StoreProduct P 
                left join StoreProductCategoryRef R on R.product = P.id 
                where R.category = t.id and P.manufacturer_id = :manufacturer_id)';
        return StoreCategory::model()
            ->getByLevel(3)
            ->findAll($condition, array(':manufacturer_id'=>$manufacturer_id));
            //->findAll(array('limit'=>$limit));
    }
    
}
