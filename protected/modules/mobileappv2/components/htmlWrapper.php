<?php
class htmlWrapper
{
	public static function checkbox($name='',$class="",$label="",$selected='', $value=1)
	{				
		?>
		<div class="custom-control custom-checkbox">  
		  <?php 
		  $check = false;
		  if(is_array($selected) && count($selected)>=1){
		  	 if(in_array($value,$selected)){
		  	 	$check = true;
		  	 }
		  } else {
		  	  $check = $selected==$value?true:false;
		  }
		  
		  echo CHtml::checkBox($name,
		  $check
		  ,array(
		    'id'=>$name,
		    'class'=>"custom-control-input",
		    'value'=>$value
		  ));
		  ?>
		  <label class="custom-control-label" for="<?php echo $name?>">
		    <?php echo mobileWrapper::t($label)?>
		  </label>
		</div>
		<?php
	}
	
} /*end class*/