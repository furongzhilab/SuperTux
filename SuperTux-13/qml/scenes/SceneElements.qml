import QtQuick 2.0

Item {
    id: level

    // this property stores all level's meta data
    property var levelMetaDataArray

    // is true, if the levels are loading right now
    property bool isLoading: false

    onLevelMetaDataArrayChanged: {
      // if the levels are not currently loading...
      if(!isLoading) {
        // ...set the levelListRepeater model to the levelMetaDataArray
        levelListRepeater.model = levelMetaDataArray
      }
    }
}
