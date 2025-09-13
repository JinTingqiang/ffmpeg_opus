cmake_minimum_required(VERSION 3.16)

project(MyQmlApp LANGUAGES CXX)

# 强制指定编译器
if (WIN32)
    set(CMAKE_C_COMPILER "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\bin\\Hostx64\\x64\\cl.exe" CACHE FILEPATH "" FORCE)
    set(CMAKE_CXX_COMPILER "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\bin\\Hostx64\\x64\\cl.exe" CACHE FILEPATH "" FORCE)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 找到 Qt6 或 Qt5
set(CMAKE_PREFIX_PATH "C:\\Qt\\6.9.2\\msvc2022_64\\lib\\cmake\\Qt6")
find_package(Qt6 COMPONENTS Quick QuickControls2 REQUIRED)
# 如果你用 Qt5: 改成 find_package(Qt5 COMPONENTS Quick REQUIRED)

qt_standard_project_setup()

qt_add_resources(APP_RESOURCES
    res/resources.qrc
)

# 添加可执行文件
qt_add_executable(MyQmlApp
    main.cpp
)

target_sources(MyQmlApp PRIVATE
    ${APP_RESOURCES}
)

# 添加 QML 资源
qt_add_qml_module(MyQmlApp
    URI MyQmlApp
    VERSION 1.0
    QML_FILES
        qml/main.qml
)

target_link_libraries(MyQmlApp
	PRIVATE Qt6::Quick Qt6::QuickControls2
)
