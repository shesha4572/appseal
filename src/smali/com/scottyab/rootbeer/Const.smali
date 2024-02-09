.class final Lcom/scottyab/rootbeer/Const;
.super Ljava/lang/Object;
.source "Const.java"


# static fields
.field static final BINARY_BUSYBOX:Ljava/lang/String; = "busybox"

.field static final BINARY_SU:Ljava/lang/String; = "su"

.field public static final knownDangerousAppsPackages:[Ljava/lang/String;

.field static final knownRootAppsPackages:[Ljava/lang/String;

.field public static final knownRootCloakingPackages:[Ljava/lang/String;

.field static final pathsThatShouldNotBeWritable:[Ljava/lang/String;

.field private static final suPaths:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 28

    .line 15
    const-string v0, "com.noshufou.android.su"

    const-string v1, "com.noshufou.android.su.elite"

    const-string v2, "eu.chainfire.supersu"

    const-string v3, "com.koushikdutta.superuser"

    const-string v4, "com.thirdparty.superuser"

    const-string v5, "com.yellowes.su"

    const-string v6, "com.topjohnwu.magisk"

    const-string v7, "com.kingroot.kinguser"

    const-string v8, "com.kingo.root"

    const-string v9, "com.smedialink.oneclickroot"

    const-string v10, "com.zhiqupk.root.global"

    const-string v11, "com.alephzain.framaroot"

    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/scottyab/rootbeer/Const;->knownRootAppsPackages:[Ljava/lang/String;

    .line 30
    const-string v1, "com.koushikdutta.rommanager"

    const-string v2, "com.koushikdutta.rommanager.license"

    const-string v3, "com.dimonvideo.luckypatcher"

    const-string v4, "com.chelpus.lackypatch"

    const-string v5, "com.ramdroid.appquarantine"

    const-string v6, "com.ramdroid.appquarantinepro"

    const-string v7, "com.android.vending.billing.InAppBillingService.COIN"

    const-string v8, "com.android.vending.billing.InAppBillingService.LUCK"

    const-string v9, "com.chelpus.luckypatcher"

    const-string v10, "com.blackmartalpha"

    const-string v11, "org.blackmart.market"

    const-string v12, "com.allinone.free"

    const-string v13, "com.repodroid.app"

    const-string v14, "org.creeplays.hack"

    const-string v15, "com.baseappfull.fwd"

    const-string v16, "com.zmapp"

    const-string v17, "com.dv.marketmod.installer"

    const-string v18, "org.mobilism.android"

    const-string v19, "com.android.wp.net.log"

    const-string v20, "com.android.camera.update"

    const-string v21, "cc.madkite.freedom"

    const-string v22, "com.solohsu.android.edxp.manager"

    const-string v23, "org.meowcat.edxposed.manager"

    const-string v24, "com.xmodgame"

    const-string v25, "com.cih.game_cih"

    const-string v26, "com.charles.lpoqasert"

    const-string v27, "catch_.me_.if_.you_.can_"

    filled-new-array/range {v1 .. v27}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/scottyab/rootbeer/Const;->knownDangerousAppsPackages:[Ljava/lang/String;

    .line 60
    const-string v1, "com.devadvance.rootcloak"

    const-string v2, "com.devadvance.rootcloakplus"

    const-string v3, "de.robv.android.xposed.installer"

    const-string v4, "com.saurik.substrate"

    const-string v5, "com.zachspong.temprootremovejb"

    const-string v6, "com.amphoras.hidemyroot"

    const-string v7, "com.amphoras.hidemyrootadfree"

    const-string v8, "com.formyhm.hiderootPremium"

    const-string v9, "com.formyhm.hideroot"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/scottyab/rootbeer/Const;->knownRootCloakingPackages:[Ljava/lang/String;

    .line 73
    const-string v1, "/data/local/"

    const-string v2, "/data/local/bin/"

    const-string v3, "/data/local/xbin/"

    const-string v4, "/sbin/"

    const-string v5, "/su/bin/"

    const-string v6, "/system/bin/"

    const-string v7, "/system/bin/.ext/"

    const-string v8, "/system/bin/failsafe/"

    const-string v9, "/system/sd/xbin/"

    const-string v10, "/system/usr/we-need-root/"

    const-string v11, "/system/xbin/"

    const-string v12, "/cache/"

    const-string v13, "/data/"

    const-string v14, "/dev/"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/scottyab/rootbeer/Const;->suPaths:[Ljava/lang/String;

    .line 91
    const-string v1, "/system"

    const-string v2, "/system/bin"

    const-string v3, "/system/sbin"

    const-string v4, "/system/xbin"

    const-string v5, "/vendor/bin"

    const-string v6, "/sbin"

    const-string v7, "/etc"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/scottyab/rootbeer/Const;->pathsThatShouldNotBeWritable:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/lang/InstantiationException;

    const-string v1, "This class is not for instantiation"

    invoke-direct {v0, v1}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static getPaths()[Ljava/lang/String;
    .locals 9

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/scottyab/rootbeer/Const;->suPaths:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 113
    .local v0, "paths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v1, "PATH"

    invoke-static {v1}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "sysPaths":Ljava/lang/String;
    const/4 v2, 0x0

    if-eqz v1, :cond_4

    const-string v3, ""

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 120
    :cond_0
    const-string v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_3

    aget-object v6, v3, v5

    .line 122
    .local v6, "path":Ljava/lang/String;
    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 123
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2f

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 126
    :cond_1
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 127
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .end local v6    # "path":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 131
    :cond_3
    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2

    .line 117
    :cond_4
    :goto_1
    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method
