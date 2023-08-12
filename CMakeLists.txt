cmake_minimum_required(VERSION 3.16)

project(bjSip VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTORCC ON)

#adding pthread flags for pjsip
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
set(THREADS_PREFER_PTHREAD_FLAG ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Quick LinguistTools )
#qt_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} translationSRC.ts)
#configure_file(${QM_FILES} ${CMAKE_SOURCE_DIR} COPYONLY)

#add pkgconfig tool for linking pjsip lib
INCLUDE(FindPkgConfig)
find_package(PkgConfig REQUIRED)
find_package(Threads REQUIRED)
find_package(OpenSSL REQUIRED)

pkg_check_modules(PJSIP "libpjproject")

add_definitions(${PJSIP_CFLAGS})
#adding paths to include dirs and static library
include_directories(${PJSIP_INCLUDE_DIRS})
include_directories(/cpp/include)
link_directories(${PJSIP_STATIC_LIBRARY_DIRS})

qt_standard_project_setup()

qt_add_executable(appbjSip
    main.cpp
    cpp/sip/bjendpoint.h cpp/sip/bjendpoint.cpp
    cpp/sip/bjcall.h cpp/sip/bjcall.cpp
    cpp/sip/bjaudiomediaport.h cpp/sip/bjaudiomediaport.cpp
    cpp/sip/bjaccount.h cpp/sip/bjaccount.cpp
    cpp/sip/bjsip.h cpp/sip/bjsip.cpp

    Models/local-storage.js
    Models/user-model.js
    Models/contact-model.js
    Models/call-history-model.js
    Utils/changeBrightness.js
    Utils/getBuddiesUsernames.js
    Resources.qrc
    ${QM_FILES}
)


qt_add_qml_module(appbjSip
    URI bjSip
    VERSION 1.0
    QML_FILES   Main.qml
                ./Views/MenuView.qml
                ./Views/AndroidView.qml
                ./Views/DesktopView.qml
                ./Views/LoginView.qml
                ./Views/RegisterView.qml
                ./Views/CallView.qml
                ./Views/SettingView.qml
                ./Views/AppBar.qml
                ./Components/Reusables/FontAwesomeIcons.qml
                ./Components/Reusables/ColorTheme.qml
                ./Components/Reusables/Icon.qml
                ./Components/Reusables/CustomTextField.qml
                ./Components/Reusables/CustomSpinBox.qml
                ./Components/Reusables/CustomButton.qml
                ./Components/Reusables/CustomLink.qml
                ./Components/Reusables/CustomText.qml
                ./Components/Reusables/CustomTabView.qml
                ./Components/Reusables/CustomTabButton.qml
                ./Components/Reusables/CustomComboBox.qml
                ./Components/Reusables/AvatarGroup.qml
                ./Components/Reusables/RoundedButton.qml
                ./Components/Reusables/Circle.qml
                ./Components/Reusables/Avatar.qml
                ./Components/Reusables/QuaterCircle.qml
                ./Components/Users/ContactList.qml
                ./Components/Users/ContactListItem.qml
                ./Components/Users/AddNewContact.qml
                ./Components/Calls/VoiceCallUserBox.qml
                ./Components/Calls/CallAnswerButton/CallAnswerButton.qml
                ./Components/Calls/CallAnswerButton/CallAnswerButtonAnimatedBorder.qml
                ./Components/Calls/CallPendingScreen.qml
                ./Components/Calls/CallPendingDots/CallPendingDot.qml
                ./Components/Calls/CallPendingDots/CallPendingDots.qml
                ./Components/Calls/CallFooter.qml
                ./Components/Calls/CallGrid.qml
                ./Components/Calls/CallHistory.qml
                ./Components/Calls/CallHistoryItem.qml
                ./Components/Calls/CallEnded.qml
                ./Components/Calls/IncomingCallPopup/IncomingCallPopup.qml
                ./Models/AppState.qml
                Resources.qrc
)

set_target_properties(appbjSip PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

#linking with pjsip lib and other dependent libs
target_link_libraries(appbjSip PRIVATE ${PJSIP_STATIC_LIBRARIES})
target_link_libraries(appbjSip PRIVATE Threads::Threads)
target_link_libraries(appbjSip PRIVATE OpenSSL::Crypto)
target_link_libraries(appbjSip PRIVATE OpenSSL::SSL)

target_link_libraries(appbjSip
    PRIVATE Qt6::Quick
)

install(TARGETS appbjSip
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
