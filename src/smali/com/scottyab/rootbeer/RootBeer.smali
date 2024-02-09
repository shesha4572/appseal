.class public Lcom/scottyab/rootbeer/RootBeer;
.super Ljava/lang/Object;
.source "RootBeer.java"


# instance fields
.field private loggingEnabled:Z

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/scottyab/rootbeer/RootBeer;->loggingEnabled:Z

    .line 34
    iput-object p1, p0, Lcom/scottyab/rootbeer/RootBeer;->mContext:Landroid/content/Context;

    .line 35
    return-void
.end method

.method private isAnyPackageFromListInstalled(Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 240
    .local p1, "packages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 242
    .local v0, "result":Z
    iget-object v1, p0, Lcom/scottyab/rootbeer/RootBeer;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 244
    .local v1, "pm":Landroid/content/pm/PackageManager;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 247
    .local v3, "packageName":Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 248
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ROOT management app detected!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/scottyab/rootbeer/util/QLog;->e(Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    const/4 v0, 0x1

    .line 252
    goto :goto_1

    .line 250
    :catch_0
    move-exception v4

    .line 253
    .end local v3    # "packageName":Ljava/lang/String;
    :goto_1
    goto :goto_0

    .line 255
    :cond_0
    return v0
.end method

.method private mountReader()[Ljava/lang/String;
    .locals 4

    .line 224
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "mount"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 225
    .local v1, "inputstream":Ljava/io/InputStream;
    if-nez v1, :cond_0

    return-object v0

    .line 226
    :cond_0
    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    const-string v3, "\\A"

    invoke-virtual {v2, v3}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v2

    .line 227
    .local v2, "propVal":Ljava/lang/String;
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 228
    .end local v1    # "inputstream":Ljava/io/InputStream;
    .end local v2    # "propVal":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 229
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    invoke-static {v1}, Lcom/scottyab/rootbeer/util/QLog;->e(Ljava/lang/Exception;)V

    .line 230
    return-object v0
.end method

.method private propsReader()[Ljava/lang/String;
    .locals 4

    .line 212
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "getprop"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 213
    .local v1, "inputstream":Ljava/io/InputStream;
    if-nez v1, :cond_0

    return-object v0

    .line 214
    :cond_0
    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    const-string v3, "\\A"

    invoke-virtual {v2, v3}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v2

    .line 215
    .local v2, "propVal":Ljava/lang/String;
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 216
    .end local v1    # "inputstream":Ljava/io/InputStream;
    .end local v2    # "propVal":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 217
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    invoke-static {v1}, Lcom/scottyab/rootbeer/util/QLog;->e(Ljava/lang/Exception;)V

    .line 218
    return-object v0
.end method


# virtual methods
.method public canLoadNativeLibrary()Z
    .locals 1

    .line 435
    new-instance v0, Lcom/scottyab/rootbeer/RootBeerNative;

    invoke-direct {v0}, Lcom/scottyab/rootbeer/RootBeerNative;-><init>()V

    invoke-virtual {v0}, Lcom/scottyab/rootbeer/RootBeerNative;->wasNativeLibraryLoaded()Z

    move-result v0

    return v0
.end method

.method public checkForBinary(Ljava/lang/String;)Z
    .locals 10
    .param p1, "filename"    # Ljava/lang/String;

    .line 184
    invoke-static {}, Lcom/scottyab/rootbeer/Const;->getPaths()[Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "pathsArray":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 188
    .local v1, "result":Z
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v0, v3

    .line 189
    .local v4, "path":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 190
    .local v5, "completePath":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .local v6, "f":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    .line 192
    .local v7, "fileExists":Z
    if-eqz v7, :cond_0

    .line 193
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " binary detected!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/scottyab/rootbeer/util/QLog;->v(Ljava/lang/Object;)V

    .line 194
    const/4 v1, 0x1

    .line 188
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "completePath":Ljava/lang/String;
    .end local v6    # "f":Ljava/io/File;
    .end local v7    # "fileExists":Z
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 198
    :cond_1
    return v1
.end method

.method public checkForBusyBoxBinary()Z
    .locals 1

    .line 174
    const-string v0, "busybox"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public checkForDangerousProps()Z
    .locals 11

    .line 264
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 265
    .local v0, "dangerousProps":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "ro.debuggable"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    const-string v1, "ro.secure"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    const/4 v1, 0x0

    .line 270
    .local v1, "result":Z
    invoke-direct {p0}, Lcom/scottyab/rootbeer/RootBeer;->propsReader()[Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, "lines":[Ljava/lang/String;
    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 274
    return v3

    .line 277
    :cond_0
    array-length v4, v2

    :goto_0
    if-ge v3, v4, :cond_3

    aget-object v5, v2, v3

    .line 278
    .local v5, "line":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 279
    .local v7, "key":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 280
    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 281
    .local v8, "badValue":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 282
    invoke-virtual {v5, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 283
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " detected!"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/scottyab/rootbeer/util/QLog;->v(Ljava/lang/Object;)V

    .line 284
    const/4 v1, 0x1

    .line 287
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "badValue":Ljava/lang/String;
    :cond_1
    goto :goto_1

    .line 277
    .end local v5    # "line":Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 289
    :cond_3
    return v1
.end method

.method public checkForMagiskBinary()Z
    .locals 1

    .line 167
    const-string v0, "magisk"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public checkForNativeLibraryReadAccess()Z
    .locals 3

    .line 421
    new-instance v0, Lcom/scottyab/rootbeer/RootBeerNative;

    invoke-direct {v0}, Lcom/scottyab/rootbeer/RootBeerNative;-><init>()V

    .line 423
    .local v0, "rootBeerNative":Lcom/scottyab/rootbeer/RootBeerNative;
    :try_start_0
    iget-boolean v1, p0, Lcom/scottyab/rootbeer/RootBeer;->loggingEnabled:Z

    invoke-virtual {v0, v1}, Lcom/scottyab/rootbeer/RootBeerNative;->setLogDebugMessages(Z)I
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 424
    const/4 v1, 0x1

    return v1

    .line 425
    :catch_0
    move-exception v1

    .line 426
    .local v1, "e":Ljava/lang/UnsatisfiedLinkError;
    const/4 v2, 0x0

    return v2
.end method

.method public checkForRWPaths()Z
    .locals 18

    .line 298
    const/4 v0, 0x0

    .line 301
    .local v0, "result":Z
    invoke-direct/range {p0 .. p0}, Lcom/scottyab/rootbeer/RootBeer;->mountReader()[Ljava/lang/String;

    move-result-object v1

    .line 303
    .local v1, "lines":[Ljava/lang/String;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 305
    return v2

    .line 309
    :cond_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 336
    .local v3, "sdkVersion":I
    array-length v4, v1

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_6

    aget-object v6, v1, v5

    .line 339
    .local v6, "line":Ljava/lang/String;
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 341
    .local v7, "args":[Ljava/lang/String;
    array-length v8, v7

    const/4 v9, 0x6

    if-ge v8, v9, :cond_1

    .line 344
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error formatting mount line: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/scottyab/rootbeer/util/QLog;->e(Ljava/lang/Object;)V

    .line 345
    move-object/from16 v17, v1

    goto/16 :goto_4

    .line 354
    :cond_1
    nop

    .line 355
    const/4 v8, 0x2

    aget-object v8, v7, v8

    .line 356
    .local v8, "mountPoint":Ljava/lang/String;
    const/4 v9, 0x5

    aget-object v9, v7, v9

    .line 362
    .local v9, "mountOptions":Ljava/lang/String;
    sget-object v10, Lcom/scottyab/rootbeer/Const;->pathsThatShouldNotBeWritable:[Ljava/lang/String;

    array-length v11, v10

    move v12, v2

    :goto_1
    if-ge v12, v11, :cond_5

    aget-object v13, v10, v12

    .line 363
    .local v13, "pathToCheck":Ljava/lang/String;
    invoke-virtual {v8, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 369
    nop

    .line 370
    const-string v14, "("

    const-string v15, ""

    invoke-virtual {v9, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 371
    const-string v14, ")"

    invoke-virtual {v9, v14, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 376
    const-string v14, ","

    invoke-virtual {v9, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    array-length v15, v14

    :goto_2
    if-ge v2, v15, :cond_3

    move/from16 v16, v0

    .end local v0    # "result":Z
    .local v16, "result":Z
    aget-object v0, v14, v2

    .line 378
    .local v0, "option":Ljava/lang/String;
    move-object/from16 v17, v1

    .end local v1    # "lines":[Ljava/lang/String;
    .local v17, "lines":[Ljava/lang/String;
    const-string v1, "rw"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 379
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " path is mounted with rw permissions! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/scottyab/rootbeer/util/QLog;->v(Ljava/lang/Object;)V

    .line 380
    const/4 v1, 0x1

    .line 381
    .end local v16    # "result":Z
    .local v1, "result":Z
    move v0, v1

    goto :goto_3

    .line 376
    .end local v0    # "option":Ljava/lang/String;
    .end local v1    # "result":Z
    .restart local v16    # "result":Z
    :cond_2
    add-int/lit8 v2, v2, 0x1

    move/from16 v0, v16

    move-object/from16 v1, v17

    goto :goto_2

    .end local v16    # "result":Z
    .end local v17    # "lines":[Ljava/lang/String;
    .local v0, "result":Z
    .local v1, "lines":[Ljava/lang/String;
    :cond_3
    move/from16 v16, v0

    move-object/from16 v17, v1

    .end local v0    # "result":Z
    .end local v1    # "lines":[Ljava/lang/String;
    .restart local v16    # "result":Z
    .restart local v17    # "lines":[Ljava/lang/String;
    goto :goto_3

    .line 363
    .end local v16    # "result":Z
    .end local v17    # "lines":[Ljava/lang/String;
    .restart local v0    # "result":Z
    .restart local v1    # "lines":[Ljava/lang/String;
    :cond_4
    move/from16 v16, v0

    move-object/from16 v17, v1

    .line 362
    .end local v1    # "lines":[Ljava/lang/String;
    .end local v13    # "pathToCheck":Ljava/lang/String;
    .restart local v17    # "lines":[Ljava/lang/String;
    :goto_3
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v1, v17

    const/4 v2, 0x0

    goto :goto_1

    .end local v17    # "lines":[Ljava/lang/String;
    .restart local v1    # "lines":[Ljava/lang/String;
    :cond_5
    move/from16 v16, v0

    move-object/from16 v17, v1

    .line 336
    .end local v1    # "lines":[Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "args":[Ljava/lang/String;
    .end local v8    # "mountPoint":Ljava/lang/String;
    .end local v9    # "mountOptions":Ljava/lang/String;
    .restart local v17    # "lines":[Ljava/lang/String;
    :goto_4
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, v17

    const/4 v2, 0x0

    goto/16 :goto_0

    .line 388
    .end local v17    # "lines":[Ljava/lang/String;
    .restart local v1    # "lines":[Ljava/lang/String;
    :cond_6
    return v0
.end method

.method public checkForRootNative()Z
    .locals 6

    .line 444
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->canLoadNativeLibrary()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 445
    const-string v0, "We could not load the native library to test for root"

    invoke-static {v0}, Lcom/scottyab/rootbeer/util/QLog;->e(Ljava/lang/Object;)V

    .line 446
    return v1

    .line 449
    :cond_0
    invoke-static {}, Lcom/scottyab/rootbeer/Const;->getPaths()[Ljava/lang/String;

    move-result-object v0

    .line 451
    .local v0, "paths":[Ljava/lang/String;
    array-length v2, v0

    new-array v2, v2, [Ljava/lang/String;

    .line 452
    .local v2, "checkPaths":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_1

    .line 453
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v5, v0, v3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "su"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 452
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 456
    .end local v3    # "i":I
    :cond_1
    new-instance v3, Lcom/scottyab/rootbeer/RootBeerNative;

    invoke-direct {v3}, Lcom/scottyab/rootbeer/RootBeerNative;-><init>()V

    .line 458
    .local v3, "rootBeerNative":Lcom/scottyab/rootbeer/RootBeerNative;
    :try_start_0
    iget-boolean v4, p0, Lcom/scottyab/rootbeer/RootBeer;->loggingEnabled:Z

    invoke-virtual {v3, v4}, Lcom/scottyab/rootbeer/RootBeerNative;->setLogDebugMessages(Z)I

    .line 459
    invoke-virtual {v3, v2}, Lcom/scottyab/rootbeer/RootBeerNative;->checkForRoot([Ljava/lang/Object;)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v4, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 460
    :catch_0
    move-exception v4

    .line 461
    .local v4, "e":Ljava/lang/UnsatisfiedLinkError;
    return v1
.end method

.method public checkForSuBinary()Z
    .locals 1

    .line 160
    const-string v0, "su"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public checkSuExists()Z
    .locals 6

    .line 397
    const/4 v0, 0x0

    .line 399
    .local v0, "process":Ljava/lang/Process;
    const/4 v1, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "which"

    aput-object v4, v3, v1

    const-string v4, "su"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    move-object v0, v2

    .line 400
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 401
    .local v2, "in":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    move v1, v5

    .line 405
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 401
    :cond_1
    return v1

    .line 402
    .end local v2    # "in":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v2

    .line 403
    .local v2, "t":Ljava/lang/Throwable;
    nop

    .line 405
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 403
    :cond_2
    return v1
.end method

.method public detectPotentiallyDangerousApps()Z
    .locals 1

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->detectPotentiallyDangerousApps([Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public detectPotentiallyDangerousApps([Ljava/lang/String;)Z
    .locals 2
    .param p1, "additionalDangerousApps"    # [Ljava/lang/String;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 123
    .local v0, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v1, Lcom/scottyab/rootbeer/Const;->knownDangerousAppsPackages:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 124
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    .line 125
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 128
    :cond_0
    invoke-direct {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->isAnyPackageFromListInstalled(Ljava/util/List;)Z

    move-result v1

    return v1
.end method

.method public detectRootCloakingApps()Z
    .locals 1

    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->detectRootCloakingApps([Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->canLoadNativeLibrary()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForNativeLibraryReadAccess()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public detectRootCloakingApps([Ljava/lang/String;)Z
    .locals 2
    .param p1, "additionalRootCloakingApps"    # [Ljava/lang/String;

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/scottyab/rootbeer/Const;->knownRootCloakingPackages:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 149
    .local v0, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    .line 150
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 152
    :cond_0
    invoke-direct {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->isAnyPackageFromListInstalled(Ljava/util/List;)Z

    move-result v1

    return v1
.end method

.method public detectRootManagementApps()Z
    .locals 1

    .line 87
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->detectRootManagementApps([Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public detectRootManagementApps([Ljava/lang/String;)Z
    .locals 2
    .param p1, "additionalRootManagementApps"    # [Ljava/lang/String;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/scottyab/rootbeer/Const;->knownRootAppsPackages:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 99
    .local v0, "packages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    .line 100
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    :cond_0
    invoke-direct {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->isAnyPackageFromListInstalled(Ljava/util/List;)Z

    move-result v1

    return v1
.end method

.method public detectTestKeys()Z
    .locals 2

    .line 77
    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 79
    .local v0, "buildTags":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v1, "test-keys"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isRooted()Z
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectRootManagementApps()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectPotentiallyDangerousApps()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "su"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 45
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForDangerousProps()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForRWPaths()Z

    move-result v0

    if-nez v0, :cond_1

    .line 46
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectTestKeys()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkSuExists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForRootNative()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForMagiskBinary()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 44
    :goto_1
    return v0
.end method

.method public isRootedWithBusyBoxCheck()Z
    .locals 1

    .line 66
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectRootManagementApps()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectPotentiallyDangerousApps()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "su"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 67
    const-string v0, "busybox"

    invoke-virtual {p0, v0}, Lcom/scottyab/rootbeer/RootBeer;->checkForBinary(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForDangerousProps()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForRWPaths()Z

    move-result v0

    if-nez v0, :cond_1

    .line 68
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->detectTestKeys()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkSuExists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForRootNative()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->checkForMagiskBinary()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 66
    :goto_1
    return v0
.end method

.method public isRootedWithoutBusyBoxCheck()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 55
    invoke-virtual {p0}, Lcom/scottyab/rootbeer/RootBeer;->isRooted()Z

    move-result v0

    return v0
.end method

.method public setLogging(Z)V
    .locals 1
    .param p1, "logging"    # Z

    .line 206
    iput-boolean p1, p0, Lcom/scottyab/rootbeer/RootBeer;->loggingEnabled:Z

    .line 207
    if-eqz p1, :cond_0

    const/4 v0, 0x5

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput v0, Lcom/scottyab/rootbeer/util/QLog;->LOGGING_LEVEL:I

    .line 208
    return-void
.end method
