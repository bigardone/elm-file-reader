const _bigardone$elm_file_reader$Native_FileReader = (function () {
  function readFile(e) {
    return _elm_lang$core$Native_Scheduler.nativeBinding((cb) => {
      const input = e.target;
      const file = input.files[0];
      const reader = new FileReader();

      reader.onload = ((event) => {
        const binary = event.target.result;

        cb(_elm_lang$core$Native_Scheduler.succeed(binary));
      });

      reader.onerror = ((err) => {
        cb(_elm_lang$core$Native_Scheduler.fail(err.toString()));
      });

      reader.readAsDataURL(file);
    });
  }

  return {
    readFile,
  };
}());
