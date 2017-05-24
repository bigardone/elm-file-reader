var _bigardone$elm_file_reader$Native_FileReader = (function () {
  function readFile(e) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function (cb) {
      var input = e.target;
      var file = input.files[0];
      var reader = new FileReader();

      reader.onload = (function (event) {
        var binary = event.target.result;

        console.log('Binary size', binary.length);

        cb(_elm_lang$core$Native_Scheduler.succeed(binary));
      });

      reader.onerror = (function (err) {
        cb(_elm_lang$core$Native_Scheduler.fail(err.toString()));
      });

      reader.readAsDataURL(file);
    });
  }

  return {
    readFile,
  };
}());
