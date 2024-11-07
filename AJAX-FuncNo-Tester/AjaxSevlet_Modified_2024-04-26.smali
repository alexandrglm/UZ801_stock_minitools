.class public Lcom/mifiservice/server/AjaxSevlet;
.super Ljavax/servlet/http/HttpServlet;
.source "AjaxSevlet.java"


# static fields
.field private static final MAX_FILE_SIZE:I = 0x1f400000

.field private static final MAX_REQUEST_SIZE:I = 0x25800000

.field private static final MEMORY_THRESHOLD:I = 0x300000

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private context:Landroid/content/Context;

.field private mDeviceController:Lcom/mifiservice/device/DeviceController;

.field private mGpsController:Lcom/mifiservice/device/GpsController;

.field private mUpdater:Lcom/mifiservice/ota/Updater;

.field private mWanApnController:Lcom/mifiservice/device/WanApnController;

.field private mWanDataController:Lcom/mifiservice/device/WanDataController;

.field private mWifiApController:Lcom/mifiservice/device/WifiApController;

.field private mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 46
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    .line 47
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    .line 48
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    .line 49
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    .line 50
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mGpsController:Lcom/mifiservice/device/GpsController;

    .line 51
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    .line 52
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    .line 54
    iput-object v0, p0, Lcom/mifiservice/server/AjaxSevlet;->mUpdater:Lcom/mifiservice/ota/Updater;

    return-void
.end method


# virtual methods
.method protected doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 7
    .param p1, "req"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "resp"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    const-string v4, "UTF-8"

    invoke-interface {p2, v4}, Ljavax/servlet/http/HttpServletResponse;->setCharacterEncoding(Ljava/lang/String;)V

    .line 67
    const-string v4, "text/json"

    invoke-interface {p2, v4}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 70
    iget-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    if-nez v4, :cond_0

    .line 71
    invoke-static {}, Lcom/mifiservice/service/MifiService;->getContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 72
    invoke-static {}, Lcom/mifiservice/device/WifiApController;->getInstance()Lcom/mifiservice/device/WifiApController;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    .line 73
    invoke-static {}, Lcom/mifiservice/device/WanDataController;->getInstance()Lcom/mifiservice/device/WanDataController;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    .line 74
    invoke-static {}, Lcom/mifiservice/device/WanApnController;->getInstance()Lcom/mifiservice/device/WanApnController;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    .line 75
    invoke-static {}, Lcom/mifiservice/device/DeviceController;->getInstance()Lcom/mifiservice/device/DeviceController;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    .line 76
    invoke-static {}, Lcom/mifiservice/device/GpsController;->getInstance()Lcom/mifiservice/device/GpsController;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mGpsController:Lcom/mifiservice/device/GpsController;

    .line 77
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    .line 79
    invoke-static {}, Lcom/mifiservice/service/MifiService;->getContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    .line 80
    invoke-static {}, Lcom/mifiservice/ota/Updater;->getInstance()Lcom/mifiservice/ota/Updater;

    move-result-object v4

    iput-object v4, p0, Lcom/mifiservice/server/AjaxSevlet;->mUpdater:Lcom/mifiservice/ota/Updater;

    .line 84
    :cond_0
    const-string v0, ""

    .line 85
    .local v0, "acceptjson":Ljava/lang/String;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getInputStream()Ljavax/servlet/ServletInputStream;

    move-result-object v5

    const-string v6, "utf-8"

    invoke-direct {v4, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 88
    .local v1, "br":Ljava/io/BufferedReader;
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v4, ""

    invoke-direct {v2, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 90
    .local v2, "sb":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "temp":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 91
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    const-string v4, "Ajax"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    return-void
.end method

.method protected doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 70
    .param p1, "req"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "resp"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    const/16 v40, 0x1

    .line 112
    .local v40, "isupload":Z
    invoke-static/range {p1 .. p1}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;->isMultipartContent(Ljavax/servlet/http/HttpServletRequest;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 113
    const/16 v40, 0x0

    .line 114
    const-string v3, "Ajax"

    const-string v66, "isupload\u03aafalse"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    :cond_0
    if-eqz v40, :cond_6

    .line 117
    const-string v3, "UTF-8"

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljavax/servlet/http/HttpServletResponse;->setCharacterEncoding(Ljava/lang/String;)V

    .line 118
    const-string v3, "Ajax"

    const-string v66, "isupload\u03aatrue"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    new-instance v30, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;

    invoke-direct/range {v30 .. v30}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;-><init>()V

    .line 120
    .local v30, "factory":Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;
    const/high16 v3, 0x300000

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;->setSizeThreshold(I)V

    .line 121
    new-instance v3, Ljava/io/File;

    const-string v66, "java.io.tmpdir"

    invoke-static/range {v66 .. v66}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;->setRepository(Ljava/io/File;)V

    .line 123
    new-instance v61, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;

    move-object/from16 v0, v61

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;-><init>(Lorg/apache/commons/fileupload/FileItemFactory;)V

    .line 125
    .local v61, "upload":Lorg/apache/commons/fileupload/servlet/ServletFileUpload;
    const-wide/32 v66, 0x1f400000

    move-object/from16 v0, v61

    move-wide/from16 v1, v66

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;->setFileSizeMax(J)V

    .line 126
    const-wide/32 v66, 0x25800000

    move-object/from16 v0, v61

    move-wide/from16 v1, v66

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;->setSizeMax(J)V

    .line 127
    const-string v3, "UTF-8"

    move-object/from16 v0, v61

    invoke-virtual {v0, v3}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;->setHeaderEncoding(Ljava/lang/String;)V

    .line 129
    const-string v63, "/data"

    .line 131
    .local v63, "uploadPath":Ljava/lang/String;
    new-instance v62, Ljava/io/File;

    invoke-direct/range {v62 .. v63}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 132
    .local v62, "uploadDir":Ljava/io/File;
    invoke-virtual/range {v62 .. v62}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 133
    invoke-virtual/range {v62 .. v62}, Ljava/io/File;->mkdir()Z

    .line 135
    :cond_1
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 139
    .local v44, "jsonObject":Lorg/json/JSONObject;
    :try_start_0
    move-object/from16 v0, v61

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/servlet/ServletFileUpload;->parseRequest(Ljavax/servlet/http/HttpServletRequest;)Ljava/util/List;

    move-result-object v33

    .line 140
    .local v33, "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    if-eqz v33, :cond_3

    invoke-interface/range {v33 .. v33}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 141
    invoke-interface/range {v33 .. v33}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v37

    .local v37, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lorg/apache/commons/fileupload/FileItem;

    .line 142
    .local v41, "item":Lorg/apache/commons/fileupload/FileItem;
    invoke-interface/range {v41 .. v41}, Lorg/apache/commons/fileupload/FileItem;->isFormField()Z

    move-result v3

    if-nez v3, :cond_2

    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v63

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v66, Ljava/io/File;->separator:Ljava/lang/String;

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v66, "update.zip"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    .line 145
    .local v32, "filePath":Ljava/lang/String;
    new-instance v58, Ljava/io/File;

    move-object/from16 v0, v58

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 146
    .local v58, "storeFile":Ljava/io/File;
    const-string v3, "Ajax"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, "filePath: "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    move-object/from16 v0, v66

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-virtual/range {v58 .. v58}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 148
    invoke-virtual/range {v58 .. v58}, Ljava/io/File;->delete()Z

    .line 149
    const-string v3, "Ajax"

    const-string v66, "\ufffd\u013c\ufffd\ufffd\u0474\ufffd\ufffd\u06a3\ufffd\u027e\ufffd\ufffd\ufffd\u013c\ufffd"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :goto_0
    move-object/from16 v0, v41

    move-object/from16 v1, v58

    invoke-interface {v0, v1}, Lorg/apache/commons/fileupload/FileItem;->write(Ljava/io/File;)V

    .line 153
    const-string v3, "Ajax"

    const-string v66, "\ufffd\u013c\ufffd\ufffd\u03f4\ufffd\ufffd\u0279\ufffd"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 944
    .end local v30    # "factory":Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;
    .end local v32    # "filePath":Ljava/lang/String;
    .end local v33    # "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    .end local v37    # "i$":Ljava/util/Iterator;
    .end local v41    # "item":Lorg/apache/commons/fileupload/FileItem;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v58    # "storeFile":Ljava/io/File;
    .end local v61    # "upload":Lorg/apache/commons/fileupload/servlet/ServletFileUpload;
    .end local v62    # "uploadDir":Ljava/io/File;
    .end local v63    # "uploadPath":Ljava/lang/String;
    :cond_3
    :goto_1
    return-void

    .line 151
    .restart local v30    # "factory":Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;
    .restart local v32    # "filePath":Ljava/lang/String;
    .restart local v33    # "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    .restart local v37    # "i$":Ljava/util/Iterator;
    .restart local v41    # "item":Lorg/apache/commons/fileupload/FileItem;
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    .restart local v58    # "storeFile":Ljava/io/File;
    .restart local v61    # "upload":Lorg/apache/commons/fileupload/servlet/ServletFileUpload;
    .restart local v62    # "uploadDir":Ljava/io/File;
    .restart local v63    # "uploadPath":Ljava/lang/String;
    :cond_4
    const-string v3, "Ajax"

    const-string v66, "\ufffd\u013c\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u06a3\ufffd\ufffd\ufffd\ufffd\ufffdwrite"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 161
    .end local v32    # "filePath":Ljava/lang/String;
    .end local v33    # "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    .end local v37    # "i$":Ljava/util/Iterator;
    .end local v41    # "item":Lorg/apache/commons/fileupload/FileItem;
    .end local v58    # "storeFile":Ljava/io/File;
    :catch_0
    move-exception v29

    .line 162
    .local v29, "ex":Ljava/lang/Exception;
    const-string v3, "Ajax"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, "\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u03e2: "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v67

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 159
    .end local v29    # "ex":Ljava/lang/Exception;
    .restart local v33    # "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    .restart local v37    # "i$":Ljava/util/Iterator;
    :cond_5
    :try_start_1
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    const-string v66, "flag:0"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 166
    .end local v30    # "factory":Lorg/apache/commons/fileupload/disk/DiskFileItemFactory;
    .end local v33    # "formItems":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/fileupload/FileItem;>;"
    .end local v37    # "i$":Ljava/util/Iterator;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v61    # "upload":Lorg/apache/commons/fileupload/servlet/ServletFileUpload;
    .end local v62    # "uploadDir":Ljava/io/File;
    .end local v63    # "uploadPath":Ljava/lang/String;
    :cond_6
    const-string v3, "UTF-8"

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljavax/servlet/http/HttpServletResponse;->setCharacterEncoding(Ljava/lang/String;)V

    .line 167
    const-string v3, "text/json"

    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 170
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    if-nez v3, :cond_7

    .line 171
    invoke-static {}, Lcom/mifiservice/service/MifiService;->getContext()Landroid/content/Context;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 172
    invoke-static {}, Lcom/mifiservice/device/WifiApController;->getInstance()Lcom/mifiservice/device/WifiApController;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    .line 173
    invoke-static {}, Lcom/mifiservice/device/WanDataController;->getInstance()Lcom/mifiservice/device/WanDataController;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    .line 174
    invoke-static {}, Lcom/mifiservice/device/WanApnController;->getInstance()Lcom/mifiservice/device/WanApnController;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    .line 175
    invoke-static {}, Lcom/mifiservice/device/DeviceController;->getInstance()Lcom/mifiservice/device/DeviceController;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    .line 176
    invoke-static {}, Lcom/mifiservice/device/GpsController;->getInstance()Lcom/mifiservice/device/GpsController;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mGpsController:Lcom/mifiservice/device/GpsController;

    .line 177
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    .line 179
    invoke-static {}, Lcom/mifiservice/service/MifiService;->getContext()Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    .line 180
    invoke-static {}, Lcom/mifiservice/ota/Updater;->getInstance()Lcom/mifiservice/ota/Updater;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mUpdater:Lcom/mifiservice/ota/Updater;

    .line 184
    :cond_7
    const-string v10, ""

    .line 185
    .local v10, "acceptjson":Ljava/lang/String;
    new-instance v14, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-interface/range {p1 .. p1}, Ljavax/servlet/http/HttpServletRequest;->getInputStream()Ljavax/servlet/ServletInputStream;

    move-result-object v66

    const-string v67, "utf-8"

    move-object/from16 v0, v66

    move-object/from16 v1, v67

    invoke-direct {v3, v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v14, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 188
    .local v14, "br":Ljava/io/BufferedReader;
    new-instance v56, Ljava/lang/StringBuffer;

    const-string v3, ""

    move-object/from16 v0, v56

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 190
    .local v56, "sb":Ljava/lang/StringBuffer;
    :goto_2
    invoke-virtual {v14}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v59

    .local v59, "temp":Ljava/lang/String;
    if-eqz v59, :cond_8

    .line 191
    move-object/from16 v0, v56

    move-object/from16 v1, v59

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 193
    :cond_8
    invoke-virtual {v14}, Ljava/io/BufferedReader;->close()V

    .line 194
    invoke-virtual/range {v56 .. v56}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 196
    const-string v3, "Ajax"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, "request: "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    :try_start_2
    new-instance v42, Lorg/json/JSONObject;

    move-object/from16 v0, v42

    invoke-direct {v0, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 202
    .local v42, "jo":Lorg/json/JSONObject;
    const-string v3, "funcNo"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v34

    .line 205
    .local v34, "funcNo":I
    const/16 v3, 0x3e8

    move/from16 v0, v34

    if-ne v0, v3, :cond_b

    .line 206
    const-string v3, "username"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v64

    check-cast v64, Ljava/lang/String;

    .line 207
    .local v64, "username":Ljava/lang/String;
    const-string v3, "password"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Ljava/lang/String;

    .line 209
    .local v53, "password":Ljava/lang/String;
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 210
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "admin"

    move-object/from16 v0, v64

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iget-object v3, v3, Lcom/mifiservice/config/MifiConfiguration;->loginPassword:Ljava/lang/String;

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 212
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 216
    .local v55, "resultObject":Lorg/json/JSONObject;
    const-string v3, "imei"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getIMEI()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
    const-string v66, "conn_mode"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->getMobileDataEnable()Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, "0"

    :goto_3
    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 218
    const-string v3, "net_mode"

    const/16 v66, 0x0

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 219
    const-string v3, "fwversion"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v67, v0

    invoke-virtual/range {v67 .. v67}, Lcom/mifiservice/device/DeviceController;->getDeviceName()Ljava/lang/String;

    move-result-object v67

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    const-string v67, "-"

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v67, v0

    invoke-virtual/range {v67 .. v67}, Lcom/mifiservice/device/DeviceController;->getSWVersion()Ljava/lang/String;

    move-result-object v67

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 222
    .local v43, "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 223
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 230
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :goto_4
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    .line 938
    .end local v34    # "funcNo":I
    .end local v42    # "jo":Lorg/json/JSONObject;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v53    # "password":Ljava/lang/String;
    .end local v64    # "username":Ljava/lang/String;
    :catch_1
    move-exception v26

    .line 939
    .local v26, "e":Ljava/lang/Exception;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Exception;->printStackTrace()V

    .line 940
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    const-string v66, "flag:0"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 217
    .end local v26    # "e":Ljava/lang/Exception;
    .restart local v34    # "funcNo":I
    .restart local v42    # "jo":Lorg/json/JSONObject;
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    .restart local v53    # "password":Ljava/lang/String;
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    .restart local v64    # "username":Ljava/lang/String;
    :cond_9
    :try_start_3
    const-string v3, "1"

    goto :goto_3

    .line 226
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_a
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    const-string v3, "error_info"

    const-string v66, "username or password error!"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4

    .line 232
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v53    # "password":Ljava/lang/String;
    .end local v64    # "username":Ljava/lang/String;
    :cond_b
    const/16 v3, 0x3e9

    move/from16 v0, v34

    if-ne v0, v3, :cond_e

    .line 233
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 234
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 238
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->getRegNetworkOperatorName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_c

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->getNetStatus()Ljava/lang/String;

    move-result-object v3

    const-string v66, "Connected"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 240
    :cond_c
    const-string v3, "rssi"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getSignalStrength()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 241
    const-string v3, "netmode"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getNetMode()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 246
    :goto_5
    const-string v3, "netstatus"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getNetStatus()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 247
    const-string v3, "oper"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 249
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 250
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 251
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 243
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    :cond_d
    const-string v3, "rssi"

    const/16 v66, 0x0

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 244
    const-string v3, "netmode"

    const-string v66, "UNKNOWN"

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_5

    .line 256
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_e
    const/16 v3, 0x3ea

    move/from16 v0, v34

    if-ne v0, v3, :cond_f

    .line 257
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 258
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 259
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 262
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "IP"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getMobileIP()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 263
    const-string v3, "mask"

    const-string v66, "255.255.255.0"

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 264
    const-string v3, "dns1"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Lcom/mifiservice/device/WifiApController;->getWlanDNS(I)Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 265
    const-string v3, "dns2"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Lcom/mifiservice/device/WifiApController;->getWlanDNS(I)Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 266
    const-string v3, "ssid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getSsid()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 267
    const-string v3, "wlan_ip"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanIP()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 268
    const-string v3, "pwd"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v66

    move-object/from16 v0, v66

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 271
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 272
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 274
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 276
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_f
    const/16 v3, 0x3eb

    move/from16 v0, v34

    if-ne v0, v3, :cond_10

    .line 277
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 278
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 279
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 281
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 282
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "up_bytes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getMobileTxBytes()J

    move-result-wide v66

    const-wide/16 v68, 0x400

    div-long v66, v66, v68

    move-object/from16 v0, v55

    move-wide/from16 v1, v66

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 283
    const-string v3, "down_bytes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getMobileRxBytes()J

    move-result-wide v66

    const-wide/16 v68, 0x400

    div-long v66, v66, v68

    move-object/from16 v0, v55

    move-wide/from16 v1, v66

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 284
    const-string v3, "longtitude"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mGpsController:Lcom/mifiservice/device/GpsController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/GpsController;->getLongitude()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 285
    const-string v3, "latitude"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mGpsController:Lcom/mifiservice/device/GpsController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/GpsController;->getLatitude()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    const-string v3, "client_num"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getClientNumber()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 287
    const-string v3, "maxSta"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiMaxSta()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 289
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 290
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 291
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 293
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 295
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_10
    const/16 v3, 0x3ec

    move/from16 v0, v34

    if-ne v0, v3, :cond_13

    .line 296
    const-string v3, "conn_mode"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 297
    .local v20, "conn_mode":Ljava/lang/String;
    const/4 v13, 0x0

    .line 299
    .local v13, "auto_conn":Z
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 300
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "1"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 301
    const/4 v13, 0x0

    .line 305
    :cond_11
    :goto_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3, v13}, Lcom/mifiservice/device/WanDataController;->setMobileDataEnable(Z)V

    .line 307
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iput-boolean v13, v3, Lcom/mifiservice/config/MifiConfiguration;->WANautoConnect:Z

    .line 308
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 310
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 311
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 313
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 302
    :cond_12
    const-string v3, "0"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 303
    const/4 v13, 0x1

    goto :goto_6

    .line 315
    .end local v13    # "auto_conn":Z
    .end local v20    # "conn_mode":Ljava/lang/String;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_13
    const/16 v3, 0x3ed

    move/from16 v0, v34

    if-ne v0, v3, :cond_15

    .line 317
    const-string v3, "net_mode"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v50

    .line 318
    .local v50, "net_mode":I
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 320
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move/from16 v0, v50

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WanDataController;->setPreferedNetworkType(I)V

    .line 321
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move/from16 v0, v50

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WANnetworkType:I

    .line 322
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 323
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->getNetMode()Ljava/lang/String;

    move-result-object v3

    const-string v66, "LTE"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    if-nez v50, :cond_14

    .line 324
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-static {}, Lcom/mifiservice/device/WanDataController;->getInstance()Lcom/mifiservice/device/WanDataController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->HandleCheckNetwork()V

    .line 325
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    const/16 v66, 0x2

    move/from16 v0, v66

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WanDataController;->setPreferedNetworkTypeAtcmd(I)V

    .line 327
    :cond_14
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 328
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 332
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v50    # "net_mode":I
    :cond_15
    const/16 v3, 0x3ee

    move/from16 v0, v34

    if-ne v0, v3, :cond_18

    .line 333
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 334
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 335
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 337
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 338
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v66, "wifi_status"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWlanStatus()Z

    move-result v3

    if-eqz v3, :cond_16

    const-string v3, "1"

    :goto_7
    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 339
    const-string v66, "ssid_flag"

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiSsidHidden()Z

    move-result v3

    if-eqz v3, :cond_17

    const-string v3, "0"

    :goto_8
    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 340
    const-string v3, "mode"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiHwMode()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 342
    const-string v3, "ip"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanIP()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 343
    const-string v3, "mac"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiMAC()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 344
    const-string v3, "ssid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getSsid()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 345
    const-string v3, "client_num"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getClientNumber()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 346
    const-string v3, "maxSta"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiMaxSta()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 347
    const-string v3, "channel"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiChannel()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 349
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 350
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 351
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 353
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 338
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    :cond_16
    const-string v3, "0"

    goto/16 :goto_7

    .line 339
    :cond_17
    const-string v3, "1"

    goto/16 :goto_8

    .line 355
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_18
    const/16 v3, 0x3ef

    move/from16 v0, v34

    if-ne v0, v3, :cond_1a

    .line 356
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 362
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "ssid"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v57

    check-cast v57, Ljava/lang/String;

    .line 363
    .local v57, "ssid":Ljava/lang/String;
    const-string v3, "maxSta"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v49

    .line 366
    .local v49, "maxSta":I
    const/4 v3, 0x6

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v35, v0

    const/4 v3, 0x0

    const-string v66, "b"

    aput-object v66, v35, v3

    const/4 v3, 0x1

    const-string v66, "g-only"

    aput-object v66, v35, v3

    const/4 v3, 0x2

    const-string v66, "n-only"

    aput-object v66, v35, v3

    const/4 v3, 0x3

    const-string v66, "g"

    aput-object v66, v35, v3

    const/4 v3, 0x4

    const-string v66, "n"

    aput-object v66, v35, v3

    const/4 v3, 0x5

    const-string v66, "a"

    aput-object v66, v35, v3

    .line 370
    .local v35, "hw_mode":[Ljava/lang/String;
    invoke-virtual/range {v57 .. v57}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v66, 0x2

    move/from16 v0, v66

    if-ge v3, v0, :cond_19

    .line 371
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 372
    const-string v3, "error_info"

    const-string v66, "ssid too short!"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 391
    :goto_9
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 374
    :cond_19
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 375
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 376
    const-string v3, "Ajax"

    const-string v66, "request: 1"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v0, v57

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WifiApController;->setSsid(Ljava/lang/String;)V

    .line 380
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move/from16 v0, v49

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WifiApController;->setWifiMaxSta(I)V

    .line 382
    const-string v3, "Ajax"

    const-string v66, "request: 2"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move-object/from16 v0, v57

    iput-object v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIssid:Ljava/lang/String;

    .line 386
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move/from16 v0, v49

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFImaxSta:I

    .line 387
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    goto :goto_9

    .line 393
    .end local v35    # "hw_mode":[Ljava/lang/String;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v49    # "maxSta":I
    .end local v57    # "ssid":Ljava/lang/String;
    :cond_1a
    const/16 v3, 0x3f0

    move/from16 v0, v34

    if-ne v0, v3, :cond_1b

    .line 394
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 395
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 396
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 398
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 399
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->restartAP()V

    goto/16 :goto_1

    .line 401
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_1b
    const/16 v3, 0x3f1

    move/from16 v0, v34

    if-ne v0, v3, :cond_1c

    .line 402
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 403
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 404
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 406
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 408
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "encryp_type"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiEncryptType()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 409
    const-string v3, "pwd"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v66

    move-object/from16 v0, v66

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 411
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 412
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 413
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 415
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 417
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_1c
    const/16 v3, 0x3f2

    move/from16 v0, v34

    if-ne v0, v3, :cond_1d

    .line 418
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 419
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 420
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 422
    const-string v3, "encryp_type"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v28

    .line 423
    .local v28, "encryp_type":I
    const-string v3, "pwd"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 425
    .local v8, "pwd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v19

    .line 426
    .local v19, "conf":Landroid/net/wifi/WifiConfiguration;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    move/from16 v1, v28

    invoke-virtual {v3, v0, v1, v8}, Lcom/mifiservice/device/WifiApController;->setWifiApConfig(Ljava/lang/String;ILjava/lang/String;)Z

    .line 428
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    iput-object v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIssid:Ljava/lang/String;

    .line 429
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move/from16 v0, v28

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIencrypt:I

    .line 430
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iput-object v8, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIpassword:Ljava/lang/String;

    .line 431
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 432
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->restartAP()V

    .line 434
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 436
    .end local v8    # "pwd":Ljava/lang/String;
    .end local v19    # "conf":Landroid/net/wifi/WifiConfiguration;
    .end local v28    # "encryp_type":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_1d
    const/16 v3, 0x3f3

    move/from16 v0, v34

    if-ne v0, v3, :cond_1f

    .line 437
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 438
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 441
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 443
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "ip"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanIP()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 444
    const-string v3, "dns1"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    const/16 v67, 0x1

    invoke-virtual/range {v66 .. v67}, Lcom/mifiservice/device/WifiApController;->getWlanDNS(I)Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 445
    const-string v3, "dns2"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    const/16 v67, 0x2

    invoke-virtual/range {v66 .. v67}, Lcom/mifiservice/device/WifiApController;->getWlanDNS(I)Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 446
    const-string v3, "range_low"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanDHCP_Low()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 447
    const-string v3, "range_high"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanDHCP_High()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 449
    new-instance v16, Lorg/json/JSONArray;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONArray;-><init>()V

    .line 450
    .local v16, "clientArray":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiClients()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1e

    .line 451
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiClients()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v37

    .restart local v37    # "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/mifiservice/device/WifiApController$WifiClient;

    .line 452
    .local v15, "client":Lcom/mifiservice/device/WifiApController$WifiClient;
    const-string v3, "AJAX"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, "wifi client: "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->name:Ljava/lang/String;

    move-object/from16 v67, v0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    const-string v67, " "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->ip:Ljava/lang/String;

    move-object/from16 v67, v0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    new-instance v17, Lorg/json/JSONObject;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONObject;-><init>()V

    .line 454
    .local v17, "clientObject":Lorg/json/JSONObject;
    const-string v3, "name"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->name:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 455
    const-string v3, "ip"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->ip:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 456
    const-string v3, "mac"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->mac:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 457
    const-string v3, "media"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->media:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 458
    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_a

    .line 462
    .end local v15    # "client":Lcom/mifiservice/device/WifiApController$WifiClient;
    .end local v17    # "clientObject":Lorg/json/JSONObject;
    .end local v37    # "i$":Ljava/util/Iterator;
    :cond_1e
    const-string v3, "device_arr"

    move-object/from16 v0, v55

    move-object/from16 v1, v16

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 464
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 465
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 466
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 468
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 470
    .end local v16    # "clientArray":Lorg/json/JSONArray;
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_1f
    const/16 v3, 0x3f4

    move/from16 v0, v34

    if-ne v0, v3, :cond_20

    .line 471
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 472
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 473
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 475
    const-string v3, "dns1"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 476
    .local v24, "dns":Ljava/lang/String;
    const-string v3, "dns2"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 478
    .local v25, "dns2":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    const/16 v66, 0x1

    move/from16 v0, v66

    move-object/from16 v1, v24

    invoke-virtual {v3, v0, v1}, Lcom/mifiservice/device/WifiApController;->setWlanDns(ILjava/lang/String;)V

    .line 479
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    const/16 v66, 0x2

    move/from16 v0, v66

    move-object/from16 v1, v25

    invoke-virtual {v3, v0, v1}, Lcom/mifiservice/device/WifiApController;->setWlanDns(ILjava/lang/String;)V

    .line 481
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 483
    .end local v24    # "dns":Ljava/lang/String;
    .end local v25    # "dns2":Ljava/lang/String;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_20
    const/16 v3, 0x3f5

    move/from16 v0, v34

    if-ne v0, v3, :cond_21

    .line 485
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 487
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 488
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 490
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    invoke-virtual {v3}, Lcom/mifiservice/device/DeviceController;->rebootDevice()V

    .line 492
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 494
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_21
    const/16 v3, 0x3f6

    move/from16 v0, v34

    if-ne v0, v3, :cond_22

    .line 496
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 498
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 499
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 501
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    invoke-virtual {v3}, Lcom/mifiservice/device/DeviceController;->restoreDevice()V

    .line 503
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 505
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_22
    const/16 v3, 0x3f7

    move/from16 v0, v34

    if-ne v0, v3, :cond_23

    .line 507
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 509
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 510
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 512
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 513
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "sim_status"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getSIMStatus()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 514
    const-string v3, "imsi"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getIMSI()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 515
    const-string v3, "iccid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getICCID()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 516
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 517
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 518
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 520
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 522
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_23
    const/16 v3, 0x3f8

    move/from16 v0, v34

    if-ne v0, v3, :cond_27

    .line 524
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 525
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const/16 v54, 0x0

    .line 526
    .local v54, "profile_num":I
    const/16 v65, 0x0

    .line 527
    .local v65, "webpronum":I
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 530
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 531
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanApnController;->getCurrentAPN()I

    move-result v54

    .line 532
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    const/16 v3, 0x795

    move/from16 v0, v54

    if-gt v0, v3, :cond_25

    .line 533
    const/16 v65, 0x0

    .line 534
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanApnController;->getDefaultApnId()I

    move-result v54

    .line 538
    :goto_b
    const-string v3, "profile_num"

    move-object/from16 v0, v55

    move/from16 v1, v65

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 540
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    const/16 v3, 0x795

    move/from16 v0, v54

    if-gt v0, v3, :cond_24

    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iget v3, v3, Lcom/mifiservice/config/MifiConfiguration;->WANdefaultAPNSave:I

    move/from16 v0, v54

    if-eq v3, v0, :cond_24

    .line 542
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move/from16 v0, v54

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WANdefaultAPNSave:I

    .line 543
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 546
    :cond_24
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 547
    .local v12, "apnsArray":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanApnController;->getAPNList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v37

    .restart local v37    # "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mifiservice/device/WanApnController$APN;

    .line 548
    .local v6, "apn":Lcom/mifiservice/device/WanApnController$APN;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 550
    .local v11, "apnObject":Lorg/json/JSONObject;
    const-string v3, "no"

    iget-object v0, v6, Lcom/mifiservice/device/WanApnController$APN;->id:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 551
    const-string v3, "name"

    iget-object v0, v6, Lcom/mifiservice/device/WanApnController$APN;->name:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 552
    const-string v3, "apn"

    iget-object v0, v6, Lcom/mifiservice/device/WanApnController$APN;->apn:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 553
    const-string v3, "user"

    iget-object v0, v6, Lcom/mifiservice/device/WanApnController$APN;->user:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 554
    const-string v3, "pwd"

    iget-object v0, v6, Lcom/mifiservice/device/WanApnController$APN;->password:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 555
    const-string v3, "auth"

    iget v0, v6, Lcom/mifiservice/device/WanApnController$APN;->authType:I

    move/from16 v66, v0

    move/from16 v0, v66

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 557
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_c

    .line 537
    .end local v6    # "apn":Lcom/mifiservice/device/WanApnController$APN;
    .end local v11    # "apnObject":Lorg/json/JSONObject;
    .end local v12    # "apnsArray":Lorg/json/JSONArray;
    .end local v37    # "i$":Ljava/util/Iterator;
    :cond_25
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    move/from16 v0, v54

    add-int/lit16 v0, v0, -0x795

    move/from16 v65, v0

    goto/16 :goto_b

    .line 559
    .restart local v12    # "apnsArray":Lorg/json/JSONArray;
    .restart local v37    # "i$":Ljava/util/Iterator;
    :cond_26
    const-string v3, "info_arr"

    move-object/from16 v0, v55

    invoke-virtual {v0, v3, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 561
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 562
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 563
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 565
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 567
    .end local v12    # "apnsArray":Lorg/json/JSONArray;
    .end local v37    # "i$":Ljava/util/Iterator;
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v54    # "profile_num":I
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    .end local v65    # "webpronum":I
    :cond_27
    const/16 v3, 0x3f9

    move/from16 v0, v34

    if-ne v0, v3, :cond_28

    .line 569
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 571
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 572
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 574
    const-string v3, "no"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 575
    .local v4, "no":I
    const-string v3, "name"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 576
    .local v5, "name":Ljava/lang/String;
    const-string v3, "apn"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 577
    .local v6, "apn":Ljava/lang/String;
    const-string v3, "user"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 578
    .local v7, "user":Ljava/lang/String;
    const-string v3, "pwd"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 579
    .restart local v8    # "pwd":Ljava/lang/String;
    const-string v3, "auth"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 581
    .local v9, "auth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    invoke-virtual/range {v3 .. v9}, Lcom/mifiservice/device/WanApnController;->addAPN2(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 583
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 585
    .end local v4    # "no":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "apn":Ljava/lang/String;
    .end local v7    # "user":Ljava/lang/String;
    .end local v8    # "pwd":Ljava/lang/String;
    .end local v9    # "auth":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_28
    const/16 v3, 0x3fa

    move/from16 v0, v34

    if-ne v0, v3, :cond_29

    .line 586
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 588
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 589
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 591
    const-string v3, "profile_num"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v54

    .line 592
    .restart local v54    # "profile_num":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanApnController:Lcom/mifiservice/device/WanApnController;

    move/from16 v0, v54

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WanApnController;->setCurrentAPN(I)V

    .line 594
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move/from16 v0, v54

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WANdefaultAPN:I

    .line 595
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 597
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 600
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v54    # "profile_num":I
    :cond_29
    const/16 v3, 0x3fc

    move/from16 v0, v34

    if-ne v0, v3, :cond_2b

    .line 601
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 602
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "oldpwd"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    .line 603
    .local v52, "oldpwd":Ljava/lang/String;
    const-string v3, "newpwd"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    .line 605
    .local v51, "newpwd":Ljava/lang/String;
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iget-object v3, v3, Lcom/mifiservice/config/MifiConfiguration;->loginPassword:Ljava/lang/String;

    move-object/from16 v0, v52

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 606
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 607
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 609
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move-object/from16 v0, v51

    iput-object v0, v3, Lcom/mifiservice/config/MifiConfiguration;->loginPassword:Ljava/lang/String;

    .line 610
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 616
    :goto_d
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 612
    :cond_2a
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 613
    const-string v3, "error_info"

    const-string v66, "old password error"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_d

    .line 619
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v51    # "newpwd":Ljava/lang/String;
    .end local v52    # "oldpwd":Ljava/lang/String;
    :cond_2b
    const/16 v3, 0x3fd

    move/from16 v0, v34

    if-ne v0, v3, :cond_2d

    .line 620
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 622
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 623
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 625
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 627
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v66, "adb_enabled"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v27

    .line 630
    .local v27, "enable":I
    const-string v66, "mode"

    if-lez v27, :cond_2c

    const-string v3, "1"

    :goto_e
    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 632
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 633
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 634
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 636
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 630
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    :cond_2c
    const-string v3, "0"

    goto :goto_e

    .line 638
    .end local v27    # "enable":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_2d
    const/16 v3, 0x3fe

    move/from16 v0, v34

    if-ne v0, v3, :cond_2f

    .line 639
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 641
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 642
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 644
    const-string v3, "mode"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v27

    .line 645
    .restart local v27    # "enable":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v66

    const-string v67, "adb_enabled"

    if-lez v27, :cond_2e

    const/4 v3, 0x1

    :goto_f
    move-object/from16 v0, v66

    move-object/from16 v1, v67

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 648
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 645
    :cond_2e
    const/4 v3, 0x0

    goto :goto_f

    .line 650
    .end local v27    # "enable":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_2f
    const/16 v3, 0x3ff

    move/from16 v0, v34

    if-ne v0, v3, :cond_30

    .line 651
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 652
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 653
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 655
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 656
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "up_bytes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getMobileTxBytes()J

    move-result-wide v66

    const-wide/16 v68, 0x400

    div-long v66, v66, v68

    move-object/from16 v0, v55

    move-wide/from16 v1, v66

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 657
    const-string v3, "down_bytes"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getMobileRxBytes()J

    move-result-wide v66

    const-wide/16 v68, 0x400

    div-long v66, v66, v68

    move-object/from16 v0, v55

    move-wide/from16 v1, v66

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 659
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 660
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 661
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 663
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 666
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_30
    const/16 v3, 0x400

    move/from16 v0, v34

    if-ne v0, v3, :cond_31

    .line 668
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 670
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 671
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 673
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    invoke-virtual {v3}, Lcom/mifiservice/device/DeviceController;->rebootDevice()V

    .line 675
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 677
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_31
    const/16 v3, 0x401

    move/from16 v0, v34

    if-ne v0, v3, :cond_32

    .line 678
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 679
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 680
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 682
    const-string v3, "ssid"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    .line 683
    .restart local v57    # "ssid":Ljava/lang/String;
    const-string v3, "pwd"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 685
    .restart local v8    # "pwd":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiApConfiguration()Landroid/net/wifi/WifiConfiguration;

    move-result-object v19

    .line 686
    .restart local v19    # "conf":Landroid/net/wifi/WifiConfiguration;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    const/16 v66, 0x3

    move-object/from16 v0, v57

    move/from16 v1, v66

    invoke-virtual {v3, v0, v1, v8}, Lcom/mifiservice/device/WifiApController;->setWifiApConfig(Ljava/lang/String;ILjava/lang/String;)Z

    .line 688
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    move-object/from16 v0, v57

    iput-object v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIssid:Ljava/lang/String;

    .line 689
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    const/16 v66, 0x3

    move/from16 v0, v66

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIencrypt:I

    .line 690
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    iput-object v8, v3, Lcom/mifiservice/config/MifiConfiguration;->WIFIpassword:Ljava/lang/String;

    .line 691
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 692
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->restartAP()V

    .line 694
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 697
    .end local v8    # "pwd":Ljava/lang/String;
    .end local v19    # "conf":Landroid/net/wifi/WifiConfiguration;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v57    # "ssid":Ljava/lang/String;
    :cond_32
    const/16 v3, 0x402

    move/from16 v0, v34

    if-ne v0, v3, :cond_33

    .line 698
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 699
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 700
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 702
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 703
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "range_low"

    move-object/from16 v0, v44

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 704
    .local v23, "dhcpLow":Ljava/lang/String;
    const-string v3, "range_high"

    move-object/from16 v0, v44

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 706
    .local v22, "dhcpHigh":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WifiApController;->setWlanDHCP_Low(Ljava/lang/String;)V

    .line 707
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WifiApController;->setWlanDHCP_High(Ljava/lang/String;)V

    .line 709
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 712
    .end local v22    # "dhcpHigh":Ljava/lang/String;
    .end local v23    # "dhcpLow":Ljava/lang/String;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_33
    const/16 v3, 0x403

    move/from16 v0, v34

    if-ne v0, v3, :cond_34

    .line 713
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 714
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 715
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 717
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 719
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "range_low"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanDHCP_Low()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 720
    const-string v3, "range_high"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WifiApController;->getWlanDHCP_High()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 723
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 724
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 725
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 727
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 730
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_34
    const/16 v3, 0x404

    move/from16 v0, v34

    if-ne v0, v3, :cond_36

    .line 731
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 732
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 733
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 735
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 737
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    new-instance v16, Lorg/json/JSONArray;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONArray;-><init>()V

    .line 738
    .restart local v16    # "clientArray":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiClients()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_35

    .line 739
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getWifiClients()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v37

    .restart local v37    # "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_35

    invoke-interface/range {v37 .. v37}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/mifiservice/device/WifiApController$WifiClient;

    .line 740
    .restart local v15    # "client":Lcom/mifiservice/device/WifiApController$WifiClient;
    const-string v3, "AJAX"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, "wifi client: "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->name:Ljava/lang/String;

    move-object/from16 v67, v0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    const-string v67, " "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->ip:Ljava/lang/String;

    move-object/from16 v67, v0

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    new-instance v17, Lorg/json/JSONObject;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONObject;-><init>()V

    .line 742
    .restart local v17    # "clientObject":Lorg/json/JSONObject;
    const-string v3, "ip"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->ip:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 743
    const-string v3, "mac"

    iget-object v0, v15, Lcom/mifiservice/device/WifiApController$WifiClient;->mac:Ljava/lang/String;

    move-object/from16 v66, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 745
    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_10

    .line 749
    .end local v15    # "client":Lcom/mifiservice/device/WifiApController$WifiClient;
    .end local v17    # "clientObject":Lorg/json/JSONObject;
    .end local v37    # "i$":Ljava/util/Iterator;
    :cond_35
    const-string v3, "device_arr"

    move-object/from16 v0, v55

    move-object/from16 v1, v16

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 751
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 752
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 753
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 755
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 756
    .end local v16    # "clientArray":Lorg/json/JSONArray;
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_36
    const/16 v3, 0x405

    move/from16 v0, v34

    if-ne v0, v3, :cond_38

    .line 758
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 759
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 760
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 762
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 764
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "imei"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/WanDataController;->getIMEI()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 765
    const-string v3, "manufacture"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/DeviceController;->getMaunufactor()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 766
    const-string v3, "fwversion"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/DeviceController;->getSWVersion()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 767
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WanDataController;->getDbm()I

    move-result v21

    .line 768
    .local v21, "dbm":I
    const/16 v3, 0x2710

    move/from16 v0, v21

    if-eq v0, v3, :cond_37

    .line 769
    const-string v3, "dbm"

    new-instance v66, Ljava/lang/StringBuilder;

    invoke-direct/range {v66 .. v66}, Ljava/lang/StringBuilder;-><init>()V

    const-string v67, " "

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    move-object/from16 v0, v66

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v66

    const-string v67, " dBm"

    invoke-virtual/range {v66 .. v67}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v66

    invoke-virtual/range {v66 .. v66}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 773
    :goto_11
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 774
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 775
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 777
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 771
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    :cond_37
    const-string v3, "dbm"

    const-string v66, ""

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_11

    .line 778
    .end local v21    # "dbm":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_38
    const/16 v3, 0x41c

    move/from16 v0, v34

    if-ne v0, v3, :cond_3a

    .line 780
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 781
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 782
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 785
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 786
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->getMacfilter()Lcom/mifiservice/device/WifiApController$MACFILTER;

    move-result-object v48

    .line 787
    .local v48, "macfilter":Lcom/mifiservice/device/WifiApController$MACFILTER;
    const-string v3, "type"

    move-object/from16 v0, v48

    iget v0, v0, Lcom/mifiservice/device/WifiApController$MACFILTER;->type:I

    move/from16 v66, v0

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 789
    new-instance v46, Lorg/json/JSONArray;

    invoke-direct/range {v46 .. v46}, Lorg/json/JSONArray;-><init>()V

    .line 790
    .local v46, "macArray":Lorg/json/JSONArray;
    const/16 v36, 0x0

    .local v36, "i":I
    :goto_12
    move-object/from16 v0, v48

    iget-object v3, v0, Lcom/mifiservice/device/WifiApController$MACFILTER;->macaddr:[Ljava/lang/String;

    array-length v3, v3

    move/from16 v0, v36

    if-ge v0, v3, :cond_39

    .line 791
    new-instance v47, Lorg/json/JSONObject;

    invoke-direct/range {v47 .. v47}, Lorg/json/JSONObject;-><init>()V

    .line 793
    .local v47, "macObject":Lorg/json/JSONObject;
    const-string v3, "id"

    add-int/lit8 v66, v36, 0x1

    move-object/from16 v0, v47

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 794
    const-string v3, "macaddr"

    move-object/from16 v0, v48

    iget-object v0, v0, Lcom/mifiservice/device/WifiApController$MACFILTER;->macaddr:[Ljava/lang/String;

    move-object/from16 v66, v0

    aget-object v66, v66, v36

    move-object/from16 v0, v47

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 796
    invoke-virtual/range {v46 .. v47}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 790
    add-int/lit8 v36, v36, 0x1

    goto :goto_12

    .line 798
    .end local v47    # "macObject":Lorg/json/JSONObject;
    :cond_39
    const-string v3, "count"

    invoke-virtual/range {v46 .. v46}, Lorg/json/JSONArray;->length()I

    move-result v66

    move-object/from16 v0, v55

    move/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 799
    const-string v3, "info_arr"

    move-object/from16 v0, v55

    move-object/from16 v1, v46

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 801
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 802
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 803
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 805
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 806
    .end local v36    # "i":I
    .end local v43    # "jsonArray":Lorg/json/JSONArray;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v46    # "macArray":Lorg/json/JSONArray;
    .end local v48    # "macfilter":Lcom/mifiservice/device/WifiApController$MACFILTER;
    .end local v55    # "resultObject":Lorg/json/JSONObject;
    :cond_3a
    const/16 v3, 0x41d

    move/from16 v0, v34

    if-ne v0, v3, :cond_3c

    .line 807
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 809
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 811
    const-string v3, "type"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v60

    .line 813
    .local v60, "type":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move/from16 v0, v60

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WifiApController;->setMacfilterType(I)Z

    move-result v3

    if-eqz v3, :cond_3b

    .line 814
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 815
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    move/from16 v0, v60

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->MACFilterType:I

    .line 816
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 821
    :goto_13
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 819
    :cond_3b
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_13

    .line 823
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v60    # "type":I
    :cond_3c
    const/16 v3, 0x41e

    move/from16 v0, v34

    if-ne v0, v3, :cond_3e

    .line 824
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 826
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 828
    const-string v3, "id"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v38, v3, -0x1

    .line 829
    .local v38, "id":I
    const-string v3, "mac"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Ljava/lang/String;

    .line 831
    .local v45, "mac":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    move/from16 v0, v38

    move-object/from16 v1, v45

    invoke-virtual {v3, v0, v1}, Lcom/mifiservice/device/WifiApController;->setMacfilterMac(ILjava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 832
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 833
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    iget-object v3, v3, Lcom/mifiservice/config/MifiConfiguration;->MACFilterList:[Ljava/lang/String;

    aput-object v45, v3, v38

    .line 834
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mifiConfiguration:Lcom/mifiservice/config/MifiConfiguration;

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 839
    :goto_14
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 837
    :cond_3d
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_14

    .line 841
    .end local v38    # "id":I
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    .end local v45    # "mac":Ljava/lang/String;
    :cond_3e
    const/16 v3, 0x41f

    move/from16 v0, v34

    if-ne v0, v3, :cond_3f

    .line 842
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 843
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 844
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 846
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWifiApController:Lcom/mifiservice/device/WifiApController;

    invoke-virtual {v3}, Lcom/mifiservice/device/WifiApController;->commitMacfilter()Z

    .line 848
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 850
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_3f
    const/16 v3, 0x7d0

    move/from16 v0, v34

    if-ne v0, v3, :cond_40

    .line 852
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 854
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 855
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 857
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    invoke-virtual {v3}, Lcom/mifiservice/device/DeviceController;->rebootBootloader()V

    .line 859
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 860
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_40
    const/16 v3, 0x7d1

    move/from16 v0, v34

    if-ne v0, v3, :cond_41

    .line 862
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 864
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 865
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 867
    const-string v1, "command"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .local v18, "command":Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 869
    .local v18, "command":Ljava/lang/String;
    :try_start_4
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 870
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v66, "sync"

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 871
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    invoke-virtual {v3}, Lcom/mifiservice/device/DeviceController;->rebootDevice()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 876
    :goto_15
    :try_start_5
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 872
    :catch_2
    move-exception v26

    .line 873
    .restart local v26    # "e":Ljava/lang/Exception;
    const-string v3, "Ajax"

    const-string v66, "setprop error"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 877
    .end local v18    # "command":Ljava/lang/String;
    .end local v26    # "e":Ljava/lang/Exception;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_41
    const/16 v3, 0x7d2

    move/from16 v0, v34

    if-ne v0, v3, :cond_43

    .line 879
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 881
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 882
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 884
    const-string v3, "imei"

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 885
    .local v39, "imei":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mWanDataController:Lcom/mifiservice/device/WanDataController;

    move-object/from16 v0, v39

    invoke-virtual {v3, v0}, Lcom/mifiservice/device/WanDataController;->setImei(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 886
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 887
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 893
    :goto_16
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 889
    :cond_42
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 890
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_16

    .line 895
    .end local v39    # "imei":Ljava/lang/String;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_43
    const/16 v3, 0xbb8

    move/from16 v0, v34

    if-ne v0, v3, :cond_44

    .line 896
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    const/16 v66, 0x0

    move/from16 v0, v66

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WANdefaultAPN:I

    .line 897
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    const/16 v66, 0x0

    move/from16 v0, v66

    iput v0, v3, Lcom/mifiservice/config/MifiConfiguration;->WANdefaultAPNSave:I

    .line 898
    invoke-static {}, Lcom/mifiservice/config/MifiConfiguration;->getInstance()Lcom/mifiservice/config/MifiConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mifiservice/config/MifiConfiguration;->saveToFile()V

    .line 899
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mifiservice/server/AjaxSevlet;->mUpdater:Lcom/mifiservice/ota/Updater;

    invoke-virtual {v3}, Lcom/mifiservice/ota/Updater;->doUpdateNoMd5()V

    .line 900
    const-string v3, "Ajax"

    const-string v66, "\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u02bc\ufffd\ufffd"

    move-object/from16 v0, v66

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 902
    :cond_44
    const/16 v3, 0xbb9

    move/from16 v0, v34

    if-ne v0, v3, :cond_47

    .line 903
    new-instance v31, Ljava/io/File;

    const-string v3, "/data/update.zip"

    move-object/from16 v0, v31

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 904
    .local v31, "file":Ljava/io/File;
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_45

    .line 905
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->delete()Z

    .line 907
    :cond_45
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_46

    .line 908
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 910
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 912
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 914
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_46
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 916
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 918
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 922
    .end local v31    # "file":Ljava/io/File;
    .end local v44    # "jsonObject":Lorg/json/JSONObject;
    :cond_47
    const/16 v3, 0xbba

    move/from16 v0, v34

    if-ne v0, v3, :cond_3

    .line 923
    new-instance v44, Lorg/json/JSONObject;

    invoke-direct/range {v44 .. v44}, Lorg/json/JSONObject;-><init>()V

    .line 925
    .restart local v44    # "jsonObject":Lorg/json/JSONObject;
    const-string v3, "flag"

    const-string v66, "1"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 926
    const-string v3, "error_info"

    const-string v66, "none"

    move-object/from16 v0, v44

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 927
    new-instance v55, Lorg/json/JSONObject;

    invoke-direct/range {v55 .. v55}, Lorg/json/JSONObject;-><init>()V

    .line 929
    .restart local v55    # "resultObject":Lorg/json/JSONObject;
    const-string v3, "device_name"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/DeviceController;->getDeviceName()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 930
    const-string v3, "sw_version"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mifiservice/server/AjaxSevlet;->mDeviceController:Lcom/mifiservice/device/DeviceController;

    move-object/from16 v66, v0

    invoke-virtual/range {v66 .. v66}, Lcom/mifiservice/device/DeviceController;->getSWVersion()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v55

    move-object/from16 v1, v66

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 932
    new-instance v43, Lorg/json/JSONArray;

    invoke-direct/range {v43 .. v43}, Lorg/json/JSONArray;-><init>()V

    .line 933
    .restart local v43    # "jsonArray":Lorg/json/JSONArray;
    move-object/from16 v0, v43

    move-object/from16 v1, v55

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 934
    const-string v3, "results"

    move-object/from16 v0, v44

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 936
    invoke-interface/range {p2 .. p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v3

    invoke-virtual/range {v44 .. v44}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v66

    move-object/from16 v0, v66

    invoke-virtual {v3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1
.end method
