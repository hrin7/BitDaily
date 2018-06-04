var summernote = $('#summernote').summernote({
   	  	toolbar: [
   		    // [groupName, [list of button]]
   		    ['style', ['bold', 'italic', 'underline', 'clear']],
   		    ['font', ['strikethrough', 'superscript', 'subscript']],
   		    ['fontsize', ['fontsize']],
   		    ['color', ['color']],
   		    ['para', ['ul', 'ol', 'paragraph']],
   		    ['height', ['height']]
   		],
        placeholder: '일기를 입력하세요',
        height: 300,
        minHeight: 300,
        maxHeight: 300, 
        width : 810
      });

$(summernote);