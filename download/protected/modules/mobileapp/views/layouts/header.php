<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>
<?php if($this->needs_db_update==TRUE):?>
<div style="background:#f3989b;padding:5px;color:#fff;text-align:center;">
<?php echo t("Your database needs update")?> 
<a href="<?php echo Yii::app()->createUrl('/mobileapp/update')?>" target="_blank"><?php echo t("click here")?></a> 
<?php echo t("to update your database")?>
</div>
<?php endif;?>