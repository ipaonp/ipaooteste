<?php
$this->renderPartial('/front/banner-fale',array(
   'h1'=>t("Contact Us"),
   'sub_text'=>$address." ".$country,
   'contact_phone'=>$contact_phone,
   'contact_email'=>$contact_email
));

$fields=yii::app()->functions->getOptionAdmin('contact_field');
if (!empty($fields)){
	$fields=json_decode($fields);
}
?>

<div class="sections section-grey2 section-contact relative">
  <div class="container-map">
     <div class="inner">
        <div class="row">
           <div class="col-md-6 grey">
             <h2 style="color:#717171"><?php echo t("Contact")." $website_title";?> </h2>
             <p style="color:#717171">
             <?php echo t("Estamos sempre felizes em ouvir de nossos clientes e visitantes, preencha o formulário para dúvidas ou entre em contato pelo Whatsapp Corporativo através do número (011)97787-0076.")?>
             </p>
             
             <p style="color:#717171"><?php echo $contact_content?></p>
                          
           </div> <!--col-->
           <div class="col-md-6 grey">
           
             <div class="top30"></div>
           
             <form class="uk-form uk-form-horizontal forms" id="forms" onsubmit="return false;">   
             <?php echo CHtml::hiddenField('action','contacUsSubmit')?>
             <?php echo CHtml::hiddenField('currentController','store')?>
             <?php FunctionsV3::addCsrfToken();?>
             <?php if (is_array($fields) && count($fields)>=1):?>
             <?php foreach ($fields as $val):?>
             <?php  
			  $placeholder='';
			  $validate_default="required";
			  switch ($val) {
			  	case "name":
			  		$placeholder="Name";
			  		break;
			  	case "email":  
			  	    $placeholder="Email address";
			  	    $validate_default="email";
			  		break;
			  	case "phone":  
			  	    $placeholder="Phone";
			  		break;
			  	case "country":  
			  	    $placeholder="Country";
			  		break;
			  	case "message":  
			  	    $placeholder="Message";
			  		break;	  	
			  	default:
			  		break;
			  }
			 ?>			 			 			
			 <?php if ( $val=="message"):?>
             <div class="row top10">
             <div class="col-md-12">
               <?php echo CHtml::textArea($val,'',array(
                'placeholder'=>t($placeholder),
                'class'=>'grey-fields full-width'
               ))?>
             </div>
             </div>
             <?php else :?>
             <div class="row top10">
             <div class="col-md-12">
               <?php echo CHtml::textField($val,'',array(
                'placeholder'=>t($placeholder),
                'class'=>'grey-fields full-width',
                'data-validation'=>$validate_default
               ))?>
             </div>
             </div>
             <?php endif;?>
             
             <?php endforeach;?>
             
                                        
             <div class="row top10">
             <div class="col-md-12 text-center">
                <input type="submit" value="<?php echo t("Submit")?>" class="orange-button medium inline rounded">
             </div>
             </div>
             <?php endif;?>
             </form>
             
             
           </div> <!--col-->
        </div> <!--row-->
     </div> <!--inner-->
  </div> <!--container-->

</div> <!--sections-->