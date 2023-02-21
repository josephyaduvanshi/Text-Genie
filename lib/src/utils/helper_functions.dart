class HelperFunctions {
  static bool checkFileStatus(String status) {
    final Map<String, bool> fileStatus = {
      'IDLE': false,
      'Importing...': true,
      'IMPORTED': true,
      'Import Error': false,
      'Processing...': true,
      'PROCESSED': true,
      'Process Error': false,
      'Saving...': true,
      'Save Error': false,
      'SAVED': true,
    };
    return fileStatus[status] ?? false;
  }

  static bool checkSaveStatus(String status) {
    final Map<String, bool> fileStatus = {
      'IDLE': true,
      'Importing...': true,
      'IMPORTED': true,
      'Import Error': false,
      'Processing...': true,
      'PROCESSED': false,
      'Process Error': false,
      'Saving...': true,
      'Save Error': false,
      'SAVED': false,
    };
    return fileStatus[status] ?? false;
  }
}
