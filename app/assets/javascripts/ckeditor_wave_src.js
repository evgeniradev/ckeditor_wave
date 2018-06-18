function initiateCkeditor() {
  var editors = Array.from(arguments);
  document.addEventListener('DOMContentLoaded', () => {
    editors.forEach(function(editor){
      newEditor(editor)
    });
  });
}

function newEditor(editor) {
  var editor = document.querySelector(editor);

  if (editor === null) return false
  try{
    ClassicEditor
      .create(editor)
      .then(editor => {
        editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
          return new UploadAdapter(loader);
        };
        document.querySelector('.ck-content').addEventListener(
          'DOMNodeRemoved', (event) => {
          var element = event.target;
          var classes = element.className.split(' ');
          if (classes.includes('image'))
            server.destroy(id(element.children[0]));
        });
      })
      .catch(error => {
        console.error(error);
      });
  } catch(error) {
    console.log(error);
    console.log('Is ckeditor.js included?', 'https://ckeditor.com/ckeditor-5/download/');
  }
}

class UploadAdapter {
  constructor(loader) {
    this.loader = loader;
  }
  upload() {
    return server.upload(this.loader.file);
  }
}

var server = {
  upload: upload,
  destroy: destroy
}

function upload(file) {
  return new Promise((resolve, reject) => {
    var xhr = new XMLHttpRequest();
    var formData = new FormData();
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4 && xhr.status !== 200)
        reject('Image upload failed');
      if (xhr.readyState === 4 && xhr.status === 200) {
        resolve({
          default: xhr.responseText
        });
        console.log('Image upload successful');
      }
    };
    formData.set('ck_image', file);
    xhr.open('POST', '/ckeditor_wave/ck_images');
    xhr.send(formData);
  });
}

function destroy(id) {
  var xhr = new XMLHttpRequest();
  var formData = new FormData();
  xhr.onreadystatechange = () => {
    if (xhr.readyState === 4 && xhr.status !== 200)
      console.log('Image deletion failed');
    if (xhr.readyState === 4 && xhr.status === 200)
      console.log(xhr.responseText);
  };
  formData.set('method', 'delete');
  xhr.open('DELETE', '/ckeditor_wave/ck_images/' + id);
  xhr.send(formData);
}

function id(element) {
  var filename = element.src.match(/[^\/]*.$/g).toString();
  return filename.match(/[^.]*/);
}
