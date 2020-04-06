
<div class="card" id="box_wrap">
<div class="card-body">

<table class="table table-striped data_tables" data-action_name="page_list">
 <thead>
  <tr>
   <th><?php echo mobileWrapper::t("ID")?></th>
   <th width="18%"><?php echo mobileWrapper::t("Title")?></th>
   <th width="20%"><?php echo mobileWrapper::t("Content")?></th>
   <th><?php echo mobileWrapper::t("icon")?></th>   
   <th><?php echo mobileWrapper::t("HTML format")?></th>   
   <th><?php echo mobileWrapper::t("Sequence")?></th>   
   <th><?php echo mobileWrapper::t("Date")?></th>   
   <th><?php echo mobileWrapper::t("Actions")?></th>
  </tr>
 </thead>
 <tbody>  
 </tbody>
</table>

</div> <!--card body-->
</div> <!--card-->


<div class="floating_action">
<div class="floating_action_inner">

<div class="row">
  <div class="col-sm">
	 <button type="button" class="btn <?php echo APP_BTN?> " data-toggle="modal" data-target="#pageNewModal"  >
	 <?php echo mobileWrapper::t("Add new")?>
	 <ion-icon name="add"></ion-icon> 
	 </button>
 </div>
 
 <div class="col-sm">
   <button type="button" class="btn btn-secondary refresh_datatables"  >
	 <?php echo mobileWrapper::t("Refresh")?>
	 <ion-icon name="refresh"></ion-icon> 
	 </button>
 </div>
 
</div> 
 
</div> 
</div><!-- floating_action-->



<div class="modal fade" id="pageNewModal" tabindex="-1" role="dialog" aria-labelledby="pageNewModal" aria-hidden="true">
 <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header"> <h5 class="modal-title" ><?php echo mt("Page")?></h5></div>
        
        <!--<form id="frm" method="post" onsubmit="return false;" data-action="save_page">-->
		<?php echo CHtml::beginForm('','post',array(
		  'id'=>"frm",
		  'onsubmit'=>"return false;",
		  'data-action'=>"save_page"
		)); 
		?> 
        
        <?php echo CHtml::hiddenField('page_id','')?>
        
        <div class="modal-body">
        
        <?php if(Yii::app()->functions->multipleField()):?>
        
        <ul class="nav nav-tabs" id="lang_tab" role="tablist">
            <li class="nav-item">
			 <a class="nav-link active"  data-toggle="tab" href="#tab_default"><?php echo mt("default")?></a>
			</li>
			<?php if ( $fields=FunctionsV3::getLanguageList(false)):?>  
			  <?php foreach ($fields as $f_val): ?>
			     <li class="nav-item">
			      <a class="nav-link"  data-toggle="tab" href="#tab_<?php echo $f_val;?>"><?php echo $f_val;?></a>
			    </li>
			  <?php endforeach;?>
			<?php endif;?>
        </ul> 
        
        <div class="tab-content" id="lang_tab">
          <div class="tab-pane fade show active" id="tab_default" >
          
          <div class="form-group">
			<label><?php echo mt("Title")?></label>		
			<?php 
			echo CHtml::textField('title','',array('class'=>"form-control",'required'=>true ));
			?>			
		   </div> 
		   
		   <div class="form-group">
			<label><?php echo mt("Content")?></label>		
			<?php 
			echo CHtml::textArea('content','',array(
			  'class'=>"form-control text_area",
			  'required'=>true
			));
			?>			
		   </div> 
          
          </div>
          <?php if(is_array($fields) && count($fields)>=1):?>
          <?php foreach ($fields as $lang_code): ?>
             <div class="tab-pane fade show" id="tab_<?php echo $lang_code;?>" >
             
             <div class="form-group">
				<label><?php echo mt("Title")?></label>		
				<?php 
				echo CHtml::textField('title_'.$lang_code,'',array('class'=>"form-control",'required'=>true ));
				?>			
			   </div> 
			   
			   <div class="form-group">
				<label><?php echo mt("Content")?></label>		
				<?php 
				echo CHtml::textArea('content_'.$lang_code,'',array(
				  'class'=>"form-control",
				  'required'=>true
				));
				?>			
		   </div>   
             
             </div>  
          <?php endforeach;?>
          <?php endif;?>
        </div>
        
        <div class="height10"></div>
        <?php else :?>
        
        
          <div class="form-group">
			<label><?php echo mt("Title")?></label>		
			<?php 
			echo CHtml::textField('title','',array('class'=>"form-control",'required'=>true ));
			?>			
		   </div> 
		   
		   <div class="form-group">
			<label><?php echo mt("Content")?></label>		
			<?php 
			echo CHtml::textArea('content','',array(
			  'class'=>"form-control",
			  'required'=>true
			));
			?>			
		   </div>  
        
        <?php endif;?>
	    
        <div class="custom-control custom-checkbox">  
		  <?php 
		  echo CHtml::checkBox('use_html',false		 
		  ,array(
		    'id'=>'use_html',
		    'class'=>"custom-control-input",
		  ));
		  ?>
		  <label class="custom-control-label" for="use_html">
		    <?php echo mobileWrapper::t("HTML Format")?>
		  </label>
		</div>
		
		<div class="height10"></div>


        <div class="form-group">
		<label><?php echo mt("Icon")?></label>		
		<?php 
		echo CHtml::textField('icon','',array('class'=>"form-control"));
		?>
		<small class="form-text text-muted">
          <?php echo mt("icon class name")?> <a target="_blank" href="https://ionicons.com/v2/">https://ionicons.com/v2/</a>
        </small>
		</div> 
		
		<div class="form-group">
		<label><?php echo mt("Sequence")?></label>		
		<?php 
		echo CHtml::textField('sequence','',array('class'=>"form-control"));
		?>
		</div> 
		
		<div class="form-group">
		<label><?php echo mt("Status")?></label>		
		<?php 
		echo CHtml::dropDownList('status',
	    ''
	    ,statusList() ,array(
	      'class'=>'form-control',      
	      'required'=>true
	    ));
		?>
		</div> 
        
        </div> <!--modal body-->
        
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">
           <?php echo mt("Close")?>
          </button>
          <button type="submit" class="btn <?php echo APP_BTN;?>"><?php echo mt("Save")?></button>
       </div>
       
      <!--</form>-->
      <?php echo CHtml::endForm() ; ?>
        
      </div><!-- content-->
 </div>
</div>