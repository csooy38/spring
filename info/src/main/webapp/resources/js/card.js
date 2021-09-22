$(document).ready(function() {
	let title = $('td.title input');
	let issued = $('td.issued input');
	let qualifi_date = $('td.qualifi_date input');
	
	for(let i=0; i<title.length; i++) {
		if(title.eq(i).val() != "" || issued.eq(i).val() != "" || qualifi_date.eq(i).val() != "") {
			title.eq(i).attr('required', true);
			issued.eq(i).attr('required', true);
			qualifi_date.eq(i).attr('required', true);
		}
	}
});

function readImg(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
	if(input.files && input.files[0].size > (10485760)) {
        alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
        input.value = null;
    }
}

function addRow(){
	$('.career>tbody:last').append(`<tr>
			+ <td class="project"><input class="form-control" required></td>
			<td class="start_date"><input class="form-control" type="date" required></td>
			<td class="end_date"><input class="form-control" type="date" required></td>
			<td class="customer"><input class="form-control" required></td>
			<td class="office"><input class="form-control" required></td>
			<td class="field" required>
				<select>
					<option value="">::선 택::</option>
					<option value="산업">산업</option>
					<option value="응용">응용</option>
				</select>
			</td>
			<td class="task"><input class="form-control" required></td>
			<td class="extra"><input class="form-control" required></td>
			<td><button class="btn btn-default" type="button" onclick="removeRow(this);"><i class="fas fa-minus"></i></button></td>
		</tr>`);
}

function removeRow(ths) {
	$(ths).parent().parent().remove();
}

function removeRowModi(ths, idx) {
	let del = $(ths).parent().parent().parent();
	
	$(del).append('<input type="hidden" name="no" value="'+idx+'">');
		
	console.log('del : ' + $('input[name=no]').val());
	
	$(ths).parent().parent().remove();
}

function nullCheck() {
	
	qualifiCheck();
	
	careerCheck();
	
}

function qualifiCheck() {
	let title = $('td.title input');
	let issued = $('td.issued input');
	let qualifi_date = $('td.qualifi_date input');
	let qualifi_idx = $('span.qualifi_idx input');
	let info_idx = $('span.info_idx input')
	
	let cnt = 0;
	
	for(let i=0; i<title.length; i++) {
		
		console.log('0');
		
		if(title.eq(i).val() != "" || issued.eq(i).val() != "" || qualifi_date.eq(i).val() != "") {
			title.eq(i).attr('required', true);
			issued.eq(i).attr('required', true);
			qualifi_date.eq(i).attr('required', true);
		}
		
		if(title.eq(i).val() != "") {
			title.eq(i).attr('name', 'qualificationList['+cnt+'].title');
			issued.eq(i).attr('name', 'qualificationList['+cnt+'].issued');
			qualifi_date.eq(i).attr('name', 'qualificationList['+cnt+'].qualifi_date');
			qualifi_idx.eq(i).attr('name', 'qualificationList['+cnt+'].qualifi_idx');
			info_idx.eq(i).attr('name', 'qualificationList['+cnt+'].info_idx')
			
			//title.eq(i).parent().append('<input type="hidden" name="qualificationList['+cnt+'].qualifi_idx" value="${qualifi['+cnt+'].qualifi_idx}">');
			
			cnt++;
			
			//alert('qualifi_idx : ' + $('input[name=qualificationList['+cnt+'].qualifi_idx]').val());
			
			alert('title.name : ' + title.eq(i).attr('name') + '\n issued : ' + issued.eq(i).attr('name') + '\n date : ' 
			+ qualifi_date.eq(i).attr('name') + '\n idx : ' + qualifi_idx.eq(i).attr('name') + '\n info_idx : ' + info_idx.eq(i).attr('name'));
			
		}
	}
}

function careerCheck() {
	
	console.log("careerCheck() 진입");
	
	let project = $('td.project input');
	let start_date = $('td.start_date input');
	let end_date = $('td.end_date input');
	let customer = $('td.customer input');
	let office = $('td.office input');
	let field = $('td.field select');
	let task = $('td.task input');
	let extra = $('td.extra input');
	
	let cnt = 0;
	
	for(let i=0; i<project.length; i++) {
		
		console.log(i + "번째 진입");
		
		if(project.eq(i).val() != "") {
			
			console.log(i + "번째 진입2");
			
			project.eq(i).attr('name', 'careerList['+cnt+'].project');
			start_date.eq(i).attr('name', 'careerList['+cnt+'].start_date');
			end_date.eq(i).attr('name', 'careerList['+cnt+'].end_date');
			customer.eq(i).attr('name', 'careerList['+cnt+'].customer');
			office.eq(i).attr('name', 'careerList['+cnt+'].office');
			field.eq(i).attr('name', 'careerList['+cnt+'].field');
			task.eq(i).attr('name', 'careerList['+cnt+'].task');
			extra.eq(i).attr('name', 'careerList['+cnt+'].extra');
			
			cnt++;
			
			alert('projcet.name : ' + project.eq(i).attr('name') + '\n start : ' + start_date.eq(i).attr('name') + '\n end : ' + end_date.eq(i).attr('name')
					+ '\n customer : ' + customer.eq(i).attr('name') + '\n office : ' + office.eq(i).attr('name') + '\n field : ' + field.eq(i).attr('name')
					+ '\n task : ' + task.eq(i).attr('name') + '\n extra : ' +extra.eq(i).attr('name') );
		}
	}
}


function delCheck(idx) {
	if(confirm('삭제된 정보는 복구되지 않습니다. \n정말 삭제하시겠습니까?')) {
		location.href='card_delete?no='+idx;
	}
}
		
$(function() {
	let title = $('td.title input');
	let issued = $('td.issued input');
	let qualifi_date = $('td.qualifi_date input');
	
	for(let i=0; i<title.length; i++) {
		$(title).eq(i).on('input', function(){
			if($(title).eq(i).val() != "") {
				title.eq(i).attr('required', true);
				issued.eq(i).attr('required', true);
				qualifi_date.eq(i).attr('required', true);
			}else{
				title.eq(i).attr('required', false);
				issued.eq(i).attr('required', false);
				qualifi_date.eq(i).attr('required', false);
			}
		});
		
		$(issued).eq(i).on('input', function(){
			if($(issued).eq(i).val() != "") {
				title.eq(i).attr('required', true);
				issued.eq(i).attr('required', true);
				qualifi_date.eq(i).attr('required', true);
			}else{
				title.eq(i).attr('required', false);
				issued.eq(i).attr('required', false);
				qualifi_date.eq(i).attr('required', false);
			}
		});
		
		$(qualifi_date).eq(i).on('input', function(){
			if($(qualifi_date).eq(i).val() != "") {
				title.eq(i).attr('required', true);
				issued.eq(i).attr('required', true);
				qualifi_date.eq(i).attr('required', true);
			}else{
				title.eq(i).attr('required', false);
				issued.eq(i).attr('required', false);
				qualifi_date.eq(i).attr('required', false);
			}
		});
	}

	let project = $('td.project input');
	let start_date = $('td.start_date input');
	let end_date = $('td.end_date input');
	let customer = $('td.customer input');
	let office = $('td.office input');
	let field = $('td.field select');
	let task = $('td.task input');
	let extra = $('td.extra input');

	for(let i=0; i<project .length; i++) {
		$(project).eq(i).on('input', function(){
			if($(project).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(start_date).eq(i).on('input', function(){
			if($(start_date).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(end_date).eq(i).on('input', function(){
			if($(end_date).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(customer).eq(i).on('input', function(){
			if($(customer).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(office).eq(i).on('input', function(){
			if($(office).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(field).eq(i).on('input', function(){
			if($(field).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(task).eq(i).on('input', function(){
			if($(task).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
		
		$(extra).eq(i).on('input', function(){
			if($(extra).eq(i).val() != "") {
				project.eq(i).attr('required', true);
				start_date.eq(i).attr('required', true);
				end_date.eq(i).attr('required', true);
				customer.eq(i).attr('required', true);
				office.eq(i).attr('required', true);
				field.eq(i).attr('required', true);
				task.eq(i).attr('required', true);
			}else{
				project.eq(i).attr('required', false);
				start_date.eq(i).attr('required', false);
				end_date.eq(i).attr('required', false);
				customer.eq(i).attr('required', false);
				office.eq(i).attr('required', false);
				field.eq(i).attr('required', false);
				task.eq(i).attr('required', false);
			}
		});
	}
});
