<div id="rl_container">
	<ul class="nav nav-tabs nav-justified nav-profile">
		<li class="active" id="resource" data-rl-id="<?php echo $resource_id; ?>" data-type="<?php echo $type; ?>"><a
					class="widthM400 ellipsis" href="#"><strong><?php echo $button_add; ?></strong></a></li>
		<?php if (has_value($object_id)) { ?>
			<li id="object" data-rl-id="<?php echo $resource_id; ?>" data-type="<?php echo $type; ?>"><a
						class="widthM400 ellipsis"
						href="#"><strong><?php echo $object_title." (".$object_name.")"; ?></strong></a></li>
		<?php } ?>
		<li id="library" data-rl-id="<?php echo $resource_id; ?>" data-type="<?php echo $type; ?>"><a
					class="widthM400 ellipsis" href="#"><span><?php echo $heading_title; ?></span></a></li>
	</ul>

	<?php
	$txt_link_resource = "Link to " . $object_title;
	$txt_unlink_resource = "Unlink from " . $object_title;
	?>

	<div class="tab-content rl-content">
		<ul id="resource_types_tabs" class="nav nav-tabs nav-justified nav-profile">
	        <?php foreach($types as $rl_type){
				switch($rl_type['type_name']){
					case 'image':
						$icon = 'fa-file-image-o';
					break;
					case 'audio':
						$icon = 'fa-file-audio-o';
					break;
					case 'video':
						$icon = 'fa-file-movie-o';
					break;
					case 'pdf':
						$icon = 'fa-file-pdf-o';
					break;
					case 'archive':
						$icon = 'fa-file-archive-o';
					break;
					case 'download':
						$icon = 'fa-download';
					break;
					default:
						$icon = 'fa-file';
				}
				$active = $current_type==$rl_type['type_name'] || (!$current_type && $rl_type['type_name']=='image') ? 'active' : '';
				?>
	        <li class="<?php echo $active; ?>" data-type="<?php echo $rl_type['type_name']; ?>">
				  <a class="itemopt tooltips"
					 onclick="return false;"
					 href="#"><i class="fa <?php echo $icon; ?>"></i> <?php echo $rl_type['type_name']; ?>
				  </a>
	        </li>
	        <?php } ?>
		</ul>

		<div id="choose_resource_type" class="row">
			<div class="col-sm-6 col-xs-12 center">
				<button class="tooltips btn btn-primary rl_add_file"
						data-original-title="<?php echo $text_add_file; ?>"><i class="fa fa-file fa-5x"></i></button>
			</div>
			<div class="col-sm-6 col-xs-12 center">
				<button class="tooltips btn btn-primary rl_add_code"
						data-original-title="<?php echo $text_add_code; ?>"><i class="fa fa-file-code-o fa-5x"></i>
				</button>
			</div>
		</div>
		<div class="row">
			<div class="panel-body panel-body-nopadding">
				<?php // resource file form ?>
				<div id="file_subform" class="col-sm-12 col-xs-12 form-horizontal form-bordered">
					<div class="resource_image center">
						<div class="fileupload_drag_area">
							<form action="<?php echo $rl_upload; ?>" method="POST" enctype="multipart/form-data">
								<div class="fileupload-buttonbar">
									<label class="btn btn-primary tooltips fileinput-button ui-button  "
										   role="button"
										   data-original-title="<?php echo $text_upload_files.' '.$text_drag; ?>">
										<span class="ui-button-text"><span><i class="fa fa-upload" style="font-size: 16em;"></i></span></span>
										<input type="file" name="files[]" multiple="">
									</label>
								</div>
							</form>
						</div>
					</div>
				</div>


				<?php echo $form['form_open']; ?>
				<?php // resource_code form ?>
				<div id="code_subform" >
					<div class="col-sm-6 col-xs-12 form-horizontal form-bordered">
						<div class="form-group <?php echo(!empty($error['resource_code']) ? "has-error" : ""); ?>">
							<label class="control-label"
								   for="<?php echo $form['field_resource_code']->element_id; ?>"><?php echo $text_resource_code; ?></label>

							<div class="input-group afield col-sm-12">
								<?php echo $form['field_resource_code']; ?>
							</div>
						</div>
					</div>


					<!-- col-sm-6 -->
					<div class="col-sm-6 col-xs-12">
						<h3 class="panel-title">&nbsp;</h3>

						<div class="form-group">
							<label class="control-label" for="<?php echo $rl_types->element_id; ?>"><?php echo $text_type; ?></label>
							<div class="input-group afield col-sm-12"><?php echo $rl_types; ?></div>
						</div>

						<div class="form-group <?php echo(!empty($error['name']) ? "has-error" : ""); ?>">
							<label class="control-label"
								   for="<?php echo $form['field_name']->element_id; ?>"><?php echo $text_name; ?></label>

							<div class="input-group afield col-sm-12">
								<?php echo $form['field_name']; ?>
							</div>
						</div>

						<div class="form-group <?php echo(!empty($error['title']) ? "has-error" : ""); ?>">
							<label class="control-label"
								   for="<?php echo $form['field_title']->element_id; ?>"><?php echo $text_title; ?></label>

							<div class="input-group afield col-sm-12">
								<?php echo $form['field_title']; ?>
							</div>
						</div>

						<div class="form-group <?php echo(!empty($error['description']) ? "has-error" : ""); ?>">
							<label class="control-label"  for="<?php echo $form['field_description']->element_id; ?>"><?php echo $text_description; ?></label>

							<div class="input-group afield col-sm-12">
								<?php echo $form['field_description']; ?>
							</div>
						</div>
					</div>
					<!-- col-sm-6 -->
				</div>
			</div>
			<div id="add_resource_buttons" class="panel-footer">
				<div class="row">
					<div class="center">
						<button class="btn btn-primary rl_save">
							<i class="fa fa-save"></i> <?php echo $button_save; ?>
						</button>
						&nbsp;
						<a class="btn btn-default rl_reset" href="<?php echo $cancel; ?>">
							<i class="fa fa-refresh"></i> <?php echo $button_reset; ?>
						</a>
					</div>
				</div>
			</div>
			</form>
		<!-- <div class="tab-content"> -->
		</div>
	</div>
