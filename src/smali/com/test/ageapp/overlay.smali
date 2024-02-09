.class public Lcom/test/ageapp/overlay;
.super Landroid/app/Activity;
.source "overlay.java"


# instance fields
.field timeout:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 22
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/test/ageapp/overlay;->timeout:I

    return-void
.end method

.method private areBlackListAppsInstalled()Ljava/lang/String;
    .locals 4

    .line 77
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 78
    .local v0, "mainIntent":Landroid/content/Intent;
    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 80
    .local v2, "queryIntentActivity":Landroid/content/pm/ResolveInfo;
    iget-object v3, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_0

    iget-object v3, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/test/ageapp/overlay;->isApplicationBlackListed(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " found on app"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "BlackListAppCheck"

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v1, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 84
    .end local v2    # "queryIntentActivity":Landroid/content/pm/ResolveInfo;
    :cond_0
    goto :goto_0

    .line 85
    :cond_1
    const-string v1, ""

    return-object v1
.end method

.method private checkVirtualBox()Z
    .locals 2

    .line 135
    new-instance v0, Ljava/io/File;

    const-string v1, "/system/lib/libdroid4x.so"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 137
    const-string v0, "qemu.hw.mainkeys"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 135
    :goto_1
    return v0
.end method

.method private isApplicationBlackListed(Ljava/lang/String;)Z
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .line 69
    invoke-direct {p0}, Lcom/test/ageapp/overlay;->loadBlackListAppList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isEmulator()Z
    .locals 7

    .line 89
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string v1, "generic"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 90
    const-string v2, "unknown"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 91
    const-string v3, "google_sdk"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 92
    const-string v4, "Emulator"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 93
    const-string v4, "Android SDK built for x86"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 94
    const-string v4, "Genymotion"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 95
    const-string v5, "ranchu"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 96
    const-string v5, "nox"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 97
    const-string v6, "nox_x86"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 98
    const-string v6, "samsungexynos7420"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 99
    const-string v6, "samsungexynos7870"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 100
    const-string v6, "mt6580"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 101
    const-string v6, "mt6592"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 102
    const-string v6, "mt6797"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 103
    const-string v6, "hi6250"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 104
    const-string v6, "smdk4x12"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 105
    const-string v6, "imx6"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 106
    const-string v6, "GenuineIntel"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 107
    const-string v6, "VMware Virtual Platform"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 109
    const-string v6, "QC_Reference_Phone"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 110
    const-string v6, "AOSP on IA Emulator"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 111
    const-string v6, "HAXM"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 112
    const-string v6, "Mali"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 114
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 115
    const-string v1, "vbox86"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 116
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 117
    const-string v5, "Droid4X"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 118
    const-string v5, "ttVM_Hdragon"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 119
    const-string v5, "Andy"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 120
    const-string v5, "sdk_gphone64_x86"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 122
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 123
    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 124
    const-string v1, "vbox"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->HOST:Ljava/lang/String;

    .line 125
    const-string v1, "Build"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    .line 126
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 127
    const-string v1, "sdk_google"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 128
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 129
    const-string v0, "ro.genymotion.version"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 130
    invoke-direct {p0}, Lcom/test/ageapp/overlay;->checkVirtualBox()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 89
    :goto_1
    return v0
.end method

.method private loadBlackListAppList()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x1de

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "app.greyshirts.sslcapture"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "app.greyshirts.sslcapturess"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "apps.zhasik007.hack"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "be.uhasselt.privacypolice"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "biz.bokhorst.xprivacy"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "blake.hamilton.bitsharktrial"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "catch_.me_.if_.you_.can_"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "cn.com.opda.gamemaster"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "cn.lm.sq"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "cn.mc.sq"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "cn.mm.gk"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "com.aa.bsw3"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "com.ad.testel"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "com.android.vendind"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "com.android.vending.billing.InAppBillingService.BINN"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "com.android.vending.billing.InAppBillingService.CLON"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "com.android.vending.billing.InAppBillingService.COIN"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "com.android.vending.billing.InAppBillingService.CRAC"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "com.android.vending.billing.InAppBillingService.LACK"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "com.android.vending.billing.InAppBillingService.LOCK"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "com.app.patcher"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "com.appsara.app"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "com.berkinalex.maninthemiddle"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "com.bugtroid"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "com.bugtroid.free.es"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "com.charles.bewlouhaqw"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string v3, "com.charles.gebukhmer"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "com.chelpus.lackypatch"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "com.chelpus.luckypatcher"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "com.cih.gamecih2"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string v3, "com.cih.game_cih"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "com.crazyricky.androidsslstrip"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "com.cryptotel.chamelemac"

    aput-object v3, v1, v2

    const/16 v2, 0x21

    const-string v3, "com.cygery.repetitouch"

    aput-object v3, v1, v2

    const/16 v2, 0x22

    const-string v3, "com.cygery.repetitouch.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x23

    const-string v3, "com.dans.apps.webd"

    aput-object v3, v1, v2

    const/16 v2, 0x24

    const-string v3, "com.devadvance.rootcloak"

    aput-object v3, v1, v2

    const/16 v2, 0x25

    const-string v3, "com.devadvance.rootcloakplus"

    aput-object v3, v1, v2

    const/16 v2, 0x26

    const-string v3, "com.device.emulator"

    aput-object v3, v1, v2

    const/16 v2, 0x27

    const-string v3, "com.dimonvideo.luckypatcher"

    aput-object v3, v1, v2

    const/16 v2, 0x28

    const-string v3, "com.dimonvideo.luckypatcherrao"

    aput-object v3, v1, v2

    const/16 v2, 0x29

    const-string v3, "com.efngames.supermacro"

    aput-object v3, v1, v2

    const/16 v2, 0x2a

    const-string v3, "com.evbadroid.proxymon"

    aput-object v3, v1, v2

    const/16 v2, 0x2b

    const-string v3, "com.evbadroid.wicap"

    aput-object v3, v1, v2

    const/16 v2, 0x2c

    const-string v3, "com.evbadroid.wicapdemo"

    aput-object v3, v1, v2

    const/16 v2, 0x2d

    const-string v3, "com.evozi.droidsniff"

    aput-object v3, v1, v2

    const/16 v2, 0x2e

    const-string v3, "com.felixheller.sharedprefseditor.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x2f

    const-string v3, "com.forpda"

    aput-object v3, v1, v2

    const/16 v2, 0x30

    const-string v3, "com.frapeti.androidbotmaker"

    aput-object v3, v1, v2

    const/16 v2, 0x31

    const-string v3, "com.ghostapps.guidelinetool"

    aput-object v3, v1, v2

    const/16 v2, 0x32

    const-string v3, "com.gmail.heagoo.apkeditor"

    aput-object v3, v1, v2

    const/16 v2, 0x33

    const-string v3, "com.gmail.heagoo.appdm"

    aput-object v3, v1, v2

    const/16 v2, 0x34

    const-string v3, "com.hexview.android.gamespector"

    aput-object v3, v1, v2

    const/16 v2, 0x35

    const-string v3, "com.huang.hl"

    aput-object v3, v1, v2

    const/16 v2, 0x36

    const-string v3, "com.huluxia.gametools"

    aput-object v3, v1, v2

    const/16 v2, 0x37

    const-string v3, "com.iiitd.RRCpacketSniffer"

    aput-object v3, v1, v2

    const/16 v2, 0x38

    const-string v3, "com.iplay.assistant"

    aput-object v3, v1, v2

    const/16 v2, 0x39

    const-string v3, "com.jake.TouchMacro"

    aput-object v3, v1, v2

    const/16 v2, 0x3a

    const-string v3, "com.jojoagogogo.simplepacketcapture"

    aput-object v3, v1, v2

    const/16 v2, 0x3b

    const-string v3, "com.leo.playcard"

    aput-object v3, v1, v2

    const/16 v2, 0x3c

    const-string v3, "com.lux.smacro"

    aput-object v3, v1, v2

    const/16 v2, 0x3d

    const-string v3, "com.moosd.netghost"

    aput-object v3, v1, v2

    const/16 v2, 0x3e

    const-string v3, "com.mopeye"

    aput-object v3, v1, v2

    const/16 v2, 0x3f

    const-string v3, "com.mpc.app.gamecenter"

    aput-object v3, v1, v2

    const/16 v2, 0x40

    const-string v3, "com.mpcgamecenter.hook"

    aput-object v3, v1, v2

    const/16 v2, 0x41

    const-string v3, "com.muzhiwan.installer"

    aput-object v3, v1, v2

    const/16 v2, 0x42

    const-string v3, "com.muzhiwan.market"

    aput-object v3, v1, v2

    const/16 v2, 0x43

    const-string v3, "com.myprog.netutils"

    aput-object v3, v1, v2

    const/16 v2, 0x44

    const-string v3, "com.netstat"

    aput-object v3, v1, v2

    const/16 v2, 0x45

    const-string v3, "com.ngocvb.network.monitoring"

    aput-object v3, v1, v2

    const/16 v2, 0x46

    const-string v3, "com.org.spoofer.macspoofer"

    aput-object v3, v1, v2

    const/16 v2, 0x47

    const-string v3, "com.paojiao.youxia"

    aput-object v3, v1, v2

    const/16 v2, 0x48

    const-string v3, "com.phoneinfo.changer"

    aput-object v3, v1, v2

    const/16 v2, 0x49

    const-string v3, "com.plcworld.udppacketanalyzer"

    aput-object v3, v1, v2

    const/16 v2, 0x4a

    const-string v3, "com.prohiro.macro"

    aput-object v3, v1, v2

    const/16 v2, 0x4b

    const-string v3, "com.rodcas.macchangermtk"

    aput-object v3, v1, v2

    const/16 v2, 0x4c

    const-string v3, "com.saitesoft.gamecheater"

    aput-object v3, v1, v2

    const/16 v2, 0x4d

    const-string v3, "com.salareeky.macaddressspoofer"

    aput-object v3, v1, v2

    const/16 v2, 0x4e

    const-string v3, "com.scott.herbert.AnDOSid"

    aput-object v3, v1, v2

    const/16 v2, 0x4f

    const-string v3, "com.serious.sniffdroid"

    aput-object v3, v1, v2

    const/16 v2, 0x50

    const-string v3, "com.sniffer"

    aput-object v3, v1, v2

    const/16 v2, 0x51

    const-string v3, "com.tcgame.gamecheater"

    aput-object v3, v1, v2

    const/16 v2, 0x52

    const-string v3, "com.teamcrak.memmory_dump"

    aput-object v3, v1, v2

    const/16 v2, 0x53

    const-string v3, "com.techfond.hackode"

    aput-object v3, v1, v2

    const/16 v2, 0x54

    const-string v3, "com.touch18.tools"

    aput-object v3, v1, v2

    const/16 v2, 0x55

    const-string v3, "com.tunnelworkshop.postern"

    aput-object v3, v1, v2

    const/16 v2, 0x56

    const-string v3, "com.usegame.android"

    aput-object v3, v1, v2

    const/16 v2, 0x57

    const-string v3, "com.VTechno.androididchanger"

    aput-object v3, v1, v2

    const/16 v2, 0x58

    const-string v3, "com.wandoujia.phoenix2"

    aput-object v3, v1, v2

    const/16 v2, 0x59

    const-string v4, "com.wireless.macchanger"

    aput-object v4, v1, v2

    const/16 v2, 0x5a

    const-string v4, "com.wood.table"

    aput-object v4, v1, v2

    const/16 v2, 0x5b

    const-string v4, "com.woodthm.thetoucherimp"

    aput-object v4, v1, v2

    const/16 v2, 0x5c

    const-string v4, "com.www.gamespeeder"

    aput-object v4, v1, v2

    const/16 v2, 0x5d

    const-string v4, "com.x0.strai.frep"

    aput-object v4, v1, v2

    const/16 v2, 0x5e

    const-string v4, "com.xmodgame"

    aput-object v4, v1, v2

    const/16 v2, 0x5f

    const-string v4, "com.xmodlite"

    aput-object v4, v1, v2

    const/16 v2, 0x60

    const-string v4, "com.xxAssistant"

    aput-object v4, v1, v2

    const/16 v2, 0x61

    const-string v4, "com.xxmod.ixmod"

    aput-object v4, v1, v2

    const/16 v2, 0x62

    const-string v4, "com.yx.shaobing"

    aput-object v4, v1, v2

    const/16 v2, 0x63

    const-string v4, "com.yx.youxia"

    aput-object v4, v1, v2

    const/16 v2, 0x64

    const-string v4, "com.zhangkongapp.joke.bamenshenqi"

    aput-object v4, v1, v2

    const/16 v2, 0x65

    const-string v4, "com.zhushou.cc"

    aput-object v4, v1, v2

    const/16 v2, 0x66

    const-string v4, "com.zimperium.zanti"

    aput-object v4, v1, v2

    const/16 v2, 0x67

    const-string v4, "cool.app.network.networkutility"

    aput-object v4, v1, v2

    const/16 v2, 0x68

    const-string v4, "de.robv.android.xposed.installer"

    aput-object v4, v1, v2

    const/16 v2, 0x69

    const-string v4, "de.trier.infsec.koch.droidsheep"

    aput-object v4, v1, v2

    const/16 v2, 0x6a

    const-string v4, "diewland.changemac"

    aput-object v4, v1, v2

    const/16 v2, 0x6b

    const-string v4, "eu.chainfire.pryfi"

    aput-object v4, v1, v2

    const/16 v2, 0x6c

    const-string v4, "glu.credits.patcher"

    aput-object v4, v1, v2

    const/16 v2, 0x6d

    const-string v4, "Hax.DaxAttack_A"

    aput-object v4, v1, v2

    const/16 v2, 0x6e

    const-string v4, "it.evilsocket.dsploit"

    aput-object v4, v1, v2

    const/16 v2, 0x6f

    const-string v4, "it.sssup.rtn.sniffer154"

    aput-object v4, v1, v2

    const/16 v2, 0x70

    const-string v4, "jp.co.taosoftware.android.packetcapture"

    aput-object v4, v1, v2

    const/16 v2, 0x71

    const-string v4, "jp.co.taosoftware.android.packetcapturepro"

    aput-object v4, v1, v2

    const/16 v2, 0x72

    const-string v4, "lksystems.wifiintruder"

    aput-object v4, v1, v2

    const/16 v2, 0x73

    const-string v4, "lv.n3o.shark"

    aput-object v4, v1, v2

    const/16 v2, 0x74

    const-string v4, "m.h.x"

    aput-object v4, v1, v2

    const/16 v2, 0x75

    const-string v4, "me.autotouch.autotouch"

    aput-object v4, v1, v2

    const/16 v2, 0x76

    const-string v4, "modded.haxplorer.bySPARDA"

    aput-object v4, v1, v2

    const/16 v2, 0x77

    const-string v4, "mr.big.stuff"

    aput-object v4, v1, v2

    const/16 v2, 0x78

    const-string v4, "net.autotouch.autotouch"

    aput-object v4, v1, v2

    const/16 v2, 0x79

    const-string v4, "net.hackerbot.hbsiteapp"

    aput-object v4, v1, v2

    const/16 v2, 0x7a

    const-string v4, "net.ponury.faceniff"

    aput-object v4, v1, v2

    const/16 v2, 0x7b

    const-string v4, "net.rclemons.arpspoof"

    aput-object v4, v1, v2

    const/16 v2, 0x7c

    const-string v4, "net.sf.ascanmem"

    aput-object v4, v1, v2

    const/16 v2, 0x7d

    const-string v4, "net.xnano.android.changemymac"

    aput-object v4, v1, v2

    const/16 v2, 0x7e

    const-string v4, "nz.pbomb.xposed.spoofmydevice"

    aput-object v4, v1, v2

    const/16 v2, 0x7f

    const-string v4, "OhRedKisa.aqua.gg"

    aput-object v4, v1, v2

    const/16 v2, 0x80

    const-string v4, "org.cheatengine.cegui"

    aput-object v4, v1, v2

    const/16 v2, 0x81

    const-string v4, "org.cjswo.guscjf"

    aput-object v4, v1, v2

    const/16 v2, 0x82

    const-string v4, "org.creeplays.hack"

    aput-object v4, v1, v2

    const/16 v2, 0x83

    const-string v4, "org.game.master"

    aput-object v4, v1, v2

    const/16 v2, 0x84

    const-string v4, "org.jajaz.cheater"

    aput-object v4, v1, v2

    const/16 v2, 0x85

    const-string v4, "org.jajaz.cheater_demo"

    aput-object v4, v1, v2

    const/16 v2, 0x86

    const-string v4, "org.sbtools.gamehack"

    aput-object v4, v1, v2

    const/16 v2, 0x87

    const-string v4, "org.sbtools.gamespeed"

    aput-object v4, v1, v2

    const/16 v2, 0x88

    const-string v4, "org.sbtools.master"

    aput-object v4, v1, v2

    const/16 v2, 0x89

    const-string v5, "pj.ishuaji.cheat"

    aput-object v5, v1, v2

    const/16 v2, 0x8a

    const-string v5, "pl.aqua.gameguardian"

    aput-object v5, v1, v2

    const/16 v2, 0x8b

    const-string v5, "pl.Nyki.DaX"

    aput-object v5, v1, v2

    const/16 v2, 0x8c

    const-string v5, "pylapp.smoothclicker.android"

    aput-object v5, v1, v2

    const/16 v2, 0x8d

    const-string v5, "ru.aaaaaaar.installer"

    aput-object v5, v1, v2

    const/16 v2, 0x8e

    const-string v5, "su.sniff.cepter"

    aput-object v5, v1, v2

    const/16 v2, 0x8f

    const-string v5, "uk.digitalsquid.netspoofer"

    aput-object v5, v1, v2

    const/16 v2, 0x90

    const-string v5, "vadim.ofer.sniffer"

    aput-object v5, v1, v2

    const/16 v2, 0x91

    const-string v5, "wei.mark.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x92

    const-string v5, "zone.bytesreverser.xposeddeviceidmaskerfree"

    aput-object v5, v1, v2

    const/16 v2, 0x93

    const-string v5, "com.saurik.substrate"

    aput-object v5, v1, v2

    const/16 v2, 0x94

    const-string v5, "com.zmngame.woodpecker"

    aput-object v5, v1, v2

    const/16 v2, 0x95

    const-string v5, "com.lizimodifier"

    aput-object v5, v1, v2

    const/16 v2, 0x96

    const-string v5, "com.muzhiwan.gamehelper.memorymanager"

    aput-object v5, v1, v2

    const/16 v2, 0x97

    const-string v5, "com.yc.gamemaster"

    aput-object v5, v1, v2

    const/16 v2, 0x98

    const-string v5, "com.dv.marketmod.installer"

    aput-object v5, v1, v2

    const/16 v2, 0x99

    const-string v5, "com.game.easytweak"

    aput-object v5, v1, v2

    const/16 v2, 0x9a

    const-string v5, "com.truedevelopersstudio.automatictap"

    aput-object v5, v1, v2

    const/16 v2, 0x9b

    const-string v5, "com.gmail.heagoo.appdm.pro"

    aput-object v5, v1, v2

    const/16 v2, 0x9c

    const-string v5, "com.inscode.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x9d

    const-string v5, "com.autoclicker.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0x9e

    const-string v5, "com.rise.automatic.autoclicker.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0x9f

    const-string v5, "simplehat.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xa0

    const-string v5, "com.erckinhtc.autoclickerautotapper"

    aput-object v5, v1, v2

    const/16 v2, 0xa1

    const-string v5, "com.mggm.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xa2

    const-string v5, "com.karta.tools.autoclickerfree"

    aput-object v5, v1, v2

    const/16 v2, 0xa3

    const-string v5, "gm.smartclick.android"

    aput-object v5, v1, v2

    const/16 v2, 0xa4

    const-string v5, "com.phonephreak.automatictapping"

    aput-object v5, v1, v2

    const/16 v2, 0xa5

    const-string v5, "com.toitoivoi.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0xa6

    const-string v5, "com.gpaddy.hungdh.floatingwidget"

    aput-object v5, v1, v2

    const/16 v2, 0xa7

    const-string v5, "com.morninggloryapps.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xa8

    const-string v5, "com.easyautoclicker.easyac"

    aput-object v5, v1, v2

    const/16 v2, 0xa9

    const-string v5, "com.karta.tools.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xaa

    const-string v5, "com.dunbartechnology.habitap"

    aput-object v5, v1, v2

    const/16 v2, 0xab

    const-string v5, "com.khpark.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xac

    const-string v5, "com.beyondsw.automatic.autoclicker.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xad

    const-string v5, "com.phawk.superfastautoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xae

    const-string v5, "com.autoclicker.auto14"

    aput-object v5, v1, v2

    const/16 v2, 0xaf

    const-string v5, "com.moistinsteck.autoclickerautomatictapeasytouch"

    aput-object v5, v1, v2

    const/16 v2, 0xb0

    const-string v5, "com.tapping.autoclickermaster"

    aput-object v5, v1, v2

    const/16 v2, 0xb1

    const-string v5, "insinncom.auto.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xb2

    const-string v5, "b_wind.automatictap.autoclicker.autoclicker.clicker.autoclickerautotapper"

    aput-object v5, v1, v2

    const/16 v2, 0xb3

    const-string v5, "com.pralambari.autoclickerautomaticclickerandtapper"

    aput-object v5, v1, v2

    const/16 v2, 0xb4

    const-string v5, "com.phonephreak.volumekeyclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xb5

    const-string v5, "com.stuvoick.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0xb6

    const-string v5, "com.autoclicker.quicktouch.tapping"

    aput-object v5, v1, v2

    const/16 v2, 0xb7

    const-string v5, "com.clonefoto.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xb8

    const-string v5, "com.nosetrap.taptap"

    aput-object v5, v1, v2

    const/16 v2, 0xb9

    const-string v5, "com.autoclicker.autoswiper4"

    aput-object v5, v1, v2

    const/16 v2, 0xba

    const-string v5, "com.bitbyteappandtools.auto_clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xbb

    const-string v5, "com.niktcho.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xbc

    const-string v5, "com.LLOVEYOU.autoclickassistant"

    aput-object v5, v1, v2

    const/16 v2, 0xbd

    const-string v5, "com.auto.easytouch"

    aput-object v5, v1, v2

    const/16 v2, 0xbe

    const-string v5, "com.pnixo.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xbf

    const-string v5, "big.joker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xc0

    const-string v5, "just.caller.autoclickerautotapper"

    aput-object v5, v1, v2

    const/16 v2, 0xc1

    const-string v5, "com.nandanappvilla.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xc2

    const-string v5, "com.autoclicker.autoopen"

    aput-object v5, v1, v2

    const/16 v2, 0xc3

    const-string v5, "bluepoint.galeps"

    aput-object v5, v1, v2

    const/16 v2, 0xc4

    const-string v5, "com.autotapper.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xc5

    const-string v5, "com.autoclicker.good"

    aput-object v5, v1, v2

    const/16 v2, 0xc6

    const-string v5, "com.monistinstick.autoclickerautomatictapper"

    aput-object v5, v1, v2

    const/16 v2, 0xc7

    const-string v5, "com.prathamtech.automaticclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xc8

    const-string v5, "com.galeps.redpoint"

    aput-object v5, v1, v2

    const/16 v2, 0xc9

    const-string v5, "com.autoclicker.autotapping"

    aput-object v5, v1, v2

    const/16 v2, 0xca

    const-string v5, "com.autoclicker.pro"

    aput-object v5, v1, v2

    const/16 v2, 0xcb

    const-string v5, "com.shutup.rxclicker.free"

    aput-object v5, v1, v2

    const/16 v2, 0xcc

    const-string v5, "me.click"

    aput-object v5, v1, v2

    const/16 v2, 0xcd

    const-string v5, "com.vpsoft.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xce

    const-string v5, "comm.atotep.atomtctpr"

    aput-object v5, v1, v2

    const/16 v2, 0xcf

    const-string v5, "com.ProcessTimer"

    aput-object v5, v1, v2

    const/16 v2, 0xd0

    const-string v5, "com.jake.touchmacro.pro"

    aput-object v5, v1, v2

    const/16 v2, 0xd1

    const-string v5, "com.clicker.automatic.tap"

    aput-object v5, v1, v2

    const/16 v2, 0xd2

    const-string v5, "auto.clicker.tapping.tapper.automatic.tap.easy.click"

    aput-object v5, v1, v2

    const/16 v2, 0xd3

    const-string v5, "comm.atomtc.atotpr"

    aput-object v5, v1, v2

    const/16 v2, 0xd4

    const-string v5, "com.automouse"

    aput-object v5, v1, v2

    const/16 v2, 0xd5

    const-string v5, "com.appautomatic.replaytouch.trial"

    aput-object v5, v1, v2

    const/16 v2, 0xd6

    const-string v5, "com.mobile_app.longphi.auto_touch"

    aput-object v5, v1, v2

    const/16 v2, 0xd7

    const-string v5, "com.balda.touchtask"

    aput-object v5, v1, v2

    const/16 v2, 0xd8

    const-string v5, "app.tylenol.a1.automouse"

    aput-object v5, v1, v2

    const/16 v2, 0xd9

    const-string v5, "com.technokriti.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0xda

    const-string v5, "de.bjoern.kinberger.botclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xdb

    const-string v5, "com.panda.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xdc

    const-string v5, "com.autoclicker.gesturepro"

    aput-object v5, v1, v2

    const/16 v2, 0xdd

    const-string v5, "fun.tooling.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xde

    const-string v5, "com.autoclicker.reliable"

    aput-object v5, v1, v2

    const/16 v2, 0xdf

    const-string v5, "com.autoclicker.best"

    aput-object v5, v1, v2

    const/16 v2, 0xe0

    const-string v5, "com.autoclicker.ice"

    aput-object v5, v1, v2

    const/16 v2, 0xe1

    const-string v5, "com.autoclicker.honeycomb"

    aput-object v5, v1, v2

    const/16 v2, 0xe2

    const-string v5, "com.autoclicker.incredible"

    aput-object v5, v1, v2

    const/16 v2, 0xe3

    const-string v5, "com.neteasvusjsndnfkzojvwancopw.pxicswub.lbjizejnz"

    aput-object v5, v1, v2

    const/16 v2, 0xe4

    const-string v5, "org.androidrepublic.vip"

    aput-object v5, v1, v2

    const/16 v2, 0xe5

    const-string v5, "com.x8zs.ds"

    aput-object v5, v1, v2

    const/16 v2, 0xe6

    const-string v5, "com.guoshi.httpcanary"

    aput-object v5, v1, v2

    const/16 v2, 0xe7

    const-string v5, "com.applisto.appcloneR"

    aput-object v5, v1, v2

    const/16 v2, 0xe8

    const-string v5, "com.felixheller.sharedprefseditor"

    aput-object v5, v1, v2

    const/16 v2, 0xe9

    const-string v5, "bb.easytouch.clicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xea

    const-string v5, "com.appautomatic.ankulua.pro2"

    aput-object v5, v1, v2

    const/16 v2, 0xeb

    const-string v5, "com.apps.srashtasoft.autoclickify"

    aput-object v5, v1, v2

    const/16 v2, 0xec

    const-string v5, "com.autoclicker.automatic.tap"

    aput-object v5, v1, v2

    const/16 v2, 0xed

    const-string v5, "com.autoclickrepeater.free"

    aput-object v5, v1, v2

    const/16 v2, 0xee

    const-string v5, "com.autoit.pretouch"

    aput-object v5, v1, v2

    const/16 v2, 0xef

    const-string v5, "com.automatic.best.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xf0

    const-string v5, "com.bagon.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0xf1

    const-string v5, "com.ddolgun.clickplanner"

    aput-object v5, v1, v2

    const/16 v2, 0xf2

    const-string v5, "com.ez.auto_click"

    aput-object v5, v1, v2

    const/16 v2, 0xf3

    const-string v5, "com.jhapps.touchrepeat"

    aput-object v5, v1, v2

    const/16 v2, 0xf4

    const-string v5, "com.superautomationstudios.autoclicker.tapclick"

    aput-object v5, v1, v2

    const/16 v2, 0xf5

    const-string v5, "com.touchsprite.android"

    aput-object v5, v1, v2

    const/16 v2, 0xf6

    const-string v5, "com.x2.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0xf7

    const-string v5, "com.zdanjian.zdanjian"

    aput-object v5, v1, v2

    const/16 v2, 0xf8

    const-string v5, "comm.swpato.esyspscr"

    aput-object v5, v1, v2

    const/16 v2, 0xf9

    const-string v5, "easytouch.automatictap.tapper.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xfa

    const-string v5, "easytouch.automatictap.tapper.clicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xfb

    const-string v5, "net.mouseautoclicker.autotapper"

    aput-object v5, v1, v2

    const/16 v2, 0xfc

    const-string v5, "net.nitkori.lokeyboard"

    aput-object v5, v1, v2

    const/16 v2, 0xfd

    const-string v5, "tahuy.trieu.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xfe

    const-string v5, "uma.automatic.automatictap.clicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0xff

    const-string v5, "com.autoclicker.autotap"

    aput-object v5, v1, v2

    const/16 v2, 0x100

    const-string v5, "komish.auto.click"

    aput-object v5, v1, v2

    const/16 v2, 0x101

    const-string v5, "com.abifog.lokiboard"

    aput-object v5, v1, v2

    const/16 v2, 0x102

    const-string v5, "simpllekeyboard.main"

    aput-object v5, v1, v2

    const/16 v2, 0x103

    const-string v5, "tej.flashkeylogger"

    aput-object v5, v1, v2

    const/16 v2, 0x104

    const-string v5, "com.android.core.mntp"

    aput-object v5, v1, v2

    const/16 v2, 0x105

    const-string v5, "com.akxlom.firo"

    aput-object v5, v1, v2

    const/16 v2, 0x106

    const-string v5, "com.rockman.dev"

    aput-object v5, v1, v2

    const/16 v2, 0x107

    const-string v5, "ms.copy99.com"

    aput-object v5, v1, v2

    const/16 v2, 0x108

    const-string v5, "com.copy9.freecopy"

    aput-object v5, v1, v2

    const/16 v2, 0x109

    const-string v5, "com.njmjmhngmlmnmfmhnkjhjpjojo.epic"

    aput-object v5, v1, v2

    const/16 v2, 0x10a

    const-string v5, "com.yiqiang.advancedsetting"

    aput-object v5, v1, v2

    const/16 v2, 0x10b

    const-string v5, "com.excelliance.transfile"

    aput-object v5, v1, v2

    const/16 v2, 0x10c

    const-string v5, "com.x8zs.sandbox.service"

    aput-object v5, v1, v2

    const/16 v2, 0x10d

    const-string v5, "com.haabut.gk"

    aput-object v5, v1, v2

    const/16 v2, 0x10e

    const-string v5, "com.zune.gamekiller"

    aput-object v5, v1, v2

    const/16 v2, 0x10f

    const-string v5, "com.android.vendinf"

    aput-object v5, v1, v2

    const/16 v2, 0x110

    const-string v5, "com.automatictap.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x111

    const-string v5, "com.osapp.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0x112

    const-string v5, "yta.automatic.tapper.easytouch.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x113

    const-string v5, "vn.autoclicker.free"

    aput-object v5, v1, v2

    const/16 v2, 0x114

    const-string v5, "com.tl.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x115

    const-string v5, "master.app.taprobot"

    aput-object v5, v1, v2

    const/16 v2, 0x116

    const-string v5, "com.askerweb.autoclickerreplay"

    aput-object v5, v1, v2

    const/16 v2, 0x117

    const-string v5, "com.autoclicker.autotap.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0x118

    const-string v5, "com.tl.autoclicker.auto.clicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x119

    const-string v5, "com.autoclicker.simple.automatic.tap"

    aput-object v5, v1, v2

    const/16 v2, 0x11a

    const-string v5, "ra.automatictap.tapper.easytouch.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x11b

    const-string v5, "com.smart.auto.clicker.easy.tapper.quicktouch.assistant"

    aput-object v5, v1, v2

    const/16 v2, 0x11c

    const-string v5, "uit.quocnguyen.autoclickerlite"

    aput-object v5, v1, v2

    const/16 v2, 0x11d

    const-string v5, "com.automatictap.autoclickerpro"

    aput-object v5, v1, v2

    const/16 v2, 0x11e

    const-string v5, "com.smartclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x11f

    const-string v5, "com.rarewood.autmatclik"

    aput-object v5, v1, v2

    const/16 v2, 0x120

    const-string v5, "com.skystarsstudio.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x121

    const-string v5, "uit.quocnguyen.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x122

    const-string v5, "com.teacher.android.sample.macrorecorderforweb"

    aput-object v5, v1, v2

    const/16 v2, 0x123

    const-string v5, "com.dai.web.scriptmacro.bot"

    aput-object v5, v1, v2

    const/16 v2, 0x124

    const-string v5, "com.ksxkq.autoclick"

    aput-object v5, v1, v2

    const/16 v2, 0x125

    const-string v5, "com.click.clicker"

    aput-object v5, v1, v2

    const/16 v2, 0x126

    const-string v5, "com.ghhan.gclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x127

    const-string v5, "dd.automaticlicks.autoclickerautotapper"

    aput-object v5, v1, v2

    const/16 v2, 0x128

    const-string v5, "com.fastbpm.clickforme.android"

    aput-object v5, v1, v2

    const/16 v2, 0x129

    const-string v5, "com.autoclicker.free.automatictap.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x12a

    const-string v5, "com.tl.auto.clicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x12b

    const-string v5, "top.niunaijun.blackdexa32"

    aput-object v5, v1, v2

    const/16 v2, 0x12c

    const-string v5, "top.niunaijun.blackdexa64"

    aput-object v5, v1, v2

    const/16 v2, 0x12d

    const-string v5, "bin.mt.plus"

    aput-object v5, v1, v2

    const/16 v2, 0x12e

    const-string v5, "bin.mt.plus.canary"

    aput-object v5, v1, v2

    const/16 v2, 0x12f

    const-string v5, "player.normal.np"

    aput-object v5, v1, v2

    const/16 v2, 0x130

    const-string v5, "io.va.exposed"

    aput-object v5, v1, v2

    const/16 v2, 0x131

    const-string v5, "io.va.exposed64"

    aput-object v5, v1, v2

    const/16 v2, 0x132

    const-string v5, "org.meowcat.edxposed.manager"

    aput-object v5, v1, v2

    const/16 v2, 0x133

    const-string v5, "org.lsposed.manager"

    aput-object v5, v1, v2

    const/16 v2, 0x134

    const-string v5, "ru.aaaaaaci.installer"

    aput-object v5, v1, v2

    const/16 v2, 0x135

    const-string v5, "com.truedevelopersstudio.automatictap.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x136

    const-string v5, "com.echozio.packethandler"

    aput-object v5, v1, v2

    const/16 v2, 0x137

    const-string v5, "com.egorovandreyrm.pcapremote"

    aput-object v5, v1, v2

    const/16 v2, 0x138

    const-string v5, "com.evbadroid.netwometer"

    aput-object v5, v1, v2

    const/16 v2, 0x139

    const-string v5, "com.hl3hl3.packet"

    aput-object v5, v1, v2

    const/16 v2, 0x13a

    const-string v5, "com.minhui.networkcapture"

    aput-object v5, v1, v2

    const/16 v2, 0x13b

    const-string v5, "com.minhui.wifianalyzer"

    aput-object v5, v1, v2

    const/16 v2, 0x13c

    const-string v5, "com.packagesniffer.frtparlak"

    aput-object v5, v1, v2

    const/16 v2, 0x13d

    const-string v5, "com.sandersoft.udpmonitor"

    aput-object v5, v1, v2

    const/16 v2, 0x13e

    const-string v5, "com.shunra.nce"

    aput-object v5, v1, v2

    const/16 v2, 0x13f

    const-string v5, "blake.hamilton.bitshark"

    aput-object v5, v1, v2

    const/16 v2, 0x140

    const-string v5, "com.emanuelef.remote_capture"

    aput-object v5, v1, v2

    const/16 v2, 0x141

    const-string v5, "com.vtechno.androididchanger"

    aput-object v5, v1, v2

    const/16 v2, 0x142

    const-string v5, "com.happymod.apk"

    aput-object v5, v1, v2

    const/16 v2, 0x143

    const-string v5, "com.aio.downloader"

    aput-object v5, v1, v2

    const/16 v2, 0x144

    const-string v5, "com.devadvance.rootcloak2"

    aput-object v5, v1, v2

    const/16 v2, 0x145

    const-string v5, "com.x8zs.ds2"

    aput-object v5, v1, v2

    const/16 v2, 0x146

    const-string v5, "com.lzb.huluxiax.pc6"

    aput-object v5, v1, v2

    const/16 v2, 0x147

    const-string v5, "cn.maocai.gameki11er"

    aput-object v5, v1, v2

    const/16 v2, 0x148

    const-string v5, "z.jasi2169.gamekiller.apk"

    aput-object v5, v1, v2

    const/16 v2, 0x149

    const-string v5, "com.bamenzhushou.forum"

    aput-object v5, v1, v2

    const/16 v2, 0x14a

    const-string v5, "com.xxxzk.qiuqiuxiao"

    aput-object v5, v1, v2

    const/16 v2, 0x14b

    const-string v5, "cn.geektang.privacyspace"

    aput-object v5, v1, v2

    const/16 v2, 0x14c

    const-string v5, "com.manjeet.op.sabif"

    aput-object v5, v1, v2

    const/16 v2, 0x14d

    const-string v5, "com.opautoclicker.autoclicker"

    aput-object v5, v1, v2

    const/16 v2, 0x14e

    const-string v5, "simplehat.clickev"

    aput-object v5, v1, v2

    const/16 v2, 0x14f

    const-string v5, "cc.madkite.freedom"

    aput-object v5, v1, v2

    const/16 v2, 0x150

    aput-object v3, v1, v2

    const/16 v2, 0x151

    const-string v3, "com.iplay.assistant.toolbox.terra"

    aput-object v3, v1, v2

    const/16 v2, 0x152

    const-string v3, "com.yoursecondworld.secondworld"

    aput-object v3, v1, v2

    const/16 v2, 0x153

    const-string v3, "com.huati"

    aput-object v3, v1, v2

    const/16 v2, 0x154

    const-string v3, "cn.maocai.gamekiller"

    aput-object v3, v1, v2

    const/16 v2, 0x155

    const-string v3, "com.luckypatchers.installer"

    aput-object v3, v1, v2

    const/16 v2, 0x156

    const-string v3, "com.lulu.luluboxpro"

    aput-object v3, v1, v2

    const/16 v2, 0x157

    aput-object v4, v1, v2

    const/16 v2, 0x158

    const-string v3, "com.sbgamehacker"

    aput-object v3, v1, v2

    const/16 v2, 0x159

    const-string v3, "com.xiongmaoxia.gameassistant"

    aput-object v3, v1, v2

    const/16 v2, 0x15a

    const-string v3, "z.jasi2169.gamekiller"

    aput-object v3, v1, v2

    const/16 v2, 0x15b

    const-string v3, "autoclicker.clicker.autoclickerapp.autoclickerforgames"

    aput-object v3, v1, v2

    const/16 v2, 0x15c

    const-string v3, "comm.autswp.forgam"

    aput-object v3, v1, v2

    const/16 v2, 0x15d

    const-string v3, "com.plitto.autoscroll.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x15e

    const-string v3, "com.simple.automatic.tap.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x15f

    const-string v3, "com.autoclicker.autoswiper2"

    aput-object v3, v1, v2

    const/16 v2, 0x160

    const-string v3, "com.meraki.ioautoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x161

    const-string v3, "com.english.recordclick"

    aput-object v3, v1, v2

    const/16 v2, 0x162

    const-string v3, "com.murgoo.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x163

    const-string v3, "com.valhalla.clicker"

    aput-object v3, v1, v2

    const/16 v2, 0x164

    const-string v3, "autoclick.ai.bot.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x165

    const-string v3, "com.speed.gc.autoclicker.automatictap"

    aput-object v3, v1, v2

    const/16 v2, 0x166

    const-string v3, "com.op.speed.autoclicker.automatictap.simpleautoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x167

    const-string v3, "com.gsautoclicker.autoclick"

    aput-object v3, v1, v2

    const/16 v2, 0x168

    const-string v3, "com.gt.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x169

    const-string v3, "com.kok_emm.mobile"

    aput-object v3, v1, v2

    const/16 v2, 0x16a

    const-string v3, "com.kolodeev.perfectclick"

    aput-object v3, v1, v2

    const/16 v2, 0x16b

    const-string v3, "com.buzbuz.smartautoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x16c

    const-string v3, "com.kvdautoclicker.android"

    aput-object v3, v1, v2

    const/16 v2, 0x16d

    const-string v3, "com.autoclicker.tapping.autoclick.clicker.clickerforgame"

    aput-object v3, v1, v2

    const/16 v2, 0x16e

    const-string v3, "com.autoclicker.automatictap.autotap.clicker"

    aput-object v3, v1, v2

    const/16 v2, 0x16f

    const-string v3, "com.falcon.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x170

    const-string v3, "com.gameclicker.autoclicker.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x171

    const-string v3, "autoclick.ai.bot"

    aput-object v3, v1, v2

    const/16 v2, 0x172

    const-string v3, "com.gameclicke.autoclicker.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x173

    const-string v3, "com.dga.apps.autoclicker.gamesclicker.autotap"

    aput-object v3, v1, v2

    const/16 v2, 0x174

    const-string v3, "com.freebest.autoclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x175

    const-string v3, "com.freebest.clickassist"

    aput-object v3, v1, v2

    const/16 v2, 0x176

    const-string v3, "com.memitouch.app"

    aput-object v3, v1, v2

    const/16 v2, 0x177

    const-string v3, "com.autoclicker.automatictap"

    aput-object v3, v1, v2

    const/16 v2, 0x178

    const-string v3, "com.autotapper.autoclick.quicktouch"

    aput-object v3, v1, v2

    const/16 v2, 0x179

    const-string v3, "com.genify.autoclicker.autotap"

    aput-object v3, v1, v2

    const/16 v2, 0x17a

    const-string v3, "com.icleversolution.xproject"

    aput-object v3, v1, v2

    const/16 v2, 0x17b

    const-string v3, "com.neil.autoclick"

    aput-object v3, v1, v2

    const/16 v2, 0x17c

    const-string v3, "com.ss.autotap.autoclicker.vclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x17d

    const-string v3, "nt.studio.ultimateclicker"

    aput-object v3, v1, v2

    const/16 v2, 0x17e

    const-string v3, "com.gmail.heagoo.apkeditor.pro"

    aput-object v3, v1, v2

    const/16 v2, 0x17f

    const-string v3, "com.gmail.heagoo.apkeditor.parser"

    aput-object v3, v1, v2

    const/16 v2, 0x180

    const-string v3, "apk.edtior.parser.unpack.apkparser"

    aput-object v3, v1, v2

    const/16 v2, 0x181

    const-string v3, "ru.aaaaaacz.installer"

    aput-object v3, v1, v2

    const/16 v2, 0x182

    const-string v3, "me.yourbay.airfrozen"

    aput-object v3, v1, v2

    const/16 v2, 0x183

    const-string v3, "com.dergoogler.mmrl"

    aput-object v3, v1, v2

    const/16 v2, 0x184

    const-string v3, "com.sanmer.mrepo"

    aput-object v3, v1, v2

    const/16 v2, 0x185

    const-string v3, "xyz.easypro.httpcustom"

    aput-object v3, v1, v2

    const/16 v2, 0x186

    const-string v3, "com.v2ray.ang"

    aput-object v3, v1, v2

    const/16 v2, 0x187

    const-string v3, "com.wn.app.np"

    aput-object v3, v1, v2

    const/16 v2, 0x188

    const-string v3, "com.tsng.hidemyapplist"

    aput-object v3, v1, v2

    const/16 v2, 0x189

    const-string v3, "co.lintian.v2manager"

    aput-object v3, v1, v2

    const/16 v2, 0x18a

    const-string v3, "me.shingle.fridaserver"

    aput-object v3, v1, v2

    const/16 v2, 0x18b

    const-string v3, "com.phvip"

    aput-object v3, v1, v2

    const/16 v2, 0x18c

    const-string v3, "org.proxydroid"

    aput-object v3, v1, v2

    const/16 v2, 0x18d

    const-string v3, "com.applisto.appcloner"

    aput-object v3, v1, v2

    const/16 v2, 0x18e

    const-string v3, "me.jsonet.jshook"

    aput-object v3, v1, v2

    const/16 v2, 0x18f

    const-string v3, "xyz.xfqlittlefan.notdeveloper"

    aput-object v3, v1, v2

    const/16 v2, 0x190

    const-string v3, "com.bluestacks.appmart"

    aput-object v3, v1, v2

    const/16 v2, 0x191

    const-string v3, "com.tencent.tinput"

    aput-object v3, v1, v2

    const/16 v2, 0x192

    const-string v3, "com.google.android.launcher.layouts.genymotion"

    aput-object v3, v1, v2

    const/16 v2, 0x193

    const-string v3, "com.koplay.launcher"

    aput-object v3, v1, v2

    const/16 v2, 0x194

    const-string v3, "com.kop.zkop.KOPTopAppChangeService"

    aput-object v3, v1, v2

    const/16 v2, 0x195

    const-string v3, "com.ldmnq.launcher"

    aput-object v3, v1, v2

    const/16 v2, 0x196

    const-string v3, "com.android.ld.appstore"

    aput-object v3, v1, v2

    const/16 v2, 0x197

    const-string v3, "com.leapdroid.hostime"

    aput-object v3, v1, v2

    const/16 v2, 0x198

    const-string v3, "com.microvirt.memuime"

    aput-object v3, v1, v2

    const/16 v2, 0x199

    const-string v3, "com.microvirt.launcher"

    aput-object v3, v1, v2

    const/16 v2, 0x19a

    const-string v3, "com.android.ld.mmstore"

    aput-object v3, v1, v2

    const/16 v2, 0x19b

    const-string v3, "com.mumu.store"

    aput-object v3, v1, v2

    const/16 v2, 0x19c

    const-string v3, "com.mumu.launcher"

    aput-object v3, v1, v2

    const/16 v2, 0x19d

    const-string v3, "com.mumu.audio"

    aput-object v3, v1, v2

    const/16 v2, 0x19e

    const-string v3, "com.bignox.appcenter"

    aput-object v3, v1, v2

    const/16 v2, 0x19f

    const-string v3, "com.nox.mopen.app"

    aput-object v3, v1, v2

    const/16 v2, 0x1a0

    const-string v3, "com.pk.peak.launcher3"

    aput-object v3, v1, v2

    const/16 v2, 0x1a1

    const-string v3, "com.pk.peak.launcher2"

    aput-object v3, v1, v2

    const/16 v2, 0x1a2

    const-string v3, "com.pk.peak.launcher"

    aput-object v3, v1, v2

    const/16 v2, 0x1a3

    const-string v3, "com.redfinger.appstore"

    aput-object v3, v1, v2

    const/16 v2, 0x1a4

    const-string v3, "com.redfinger.monitor"

    aput-object v3, v1, v2

    const/16 v2, 0x1a5

    const-string v3, "com.tiantian.ime"

    aput-object v3, v1, v2

    const/16 v2, 0x1a6

    const-string v3, "com.kingroot.kinguser"

    aput-object v3, v1, v2

    const/16 v2, 0x1a7

    const-string v3, "com.koushikdutta.superuser"

    aput-object v3, v1, v2

    const/16 v2, 0x1a8

    const-string v3, "com.noshufou.android.su"

    aput-object v3, v1, v2

    const/16 v2, 0x1a9

    const-string v3, "com.noshufou.android.su.elite"

    aput-object v3, v1, v2

    const/16 v2, 0x1aa

    const-string v3, "com.ramdroid.appquarantine"

    aput-object v3, v1, v2

    const/16 v2, 0x1ab

    const-string v3, "com.shuame.rootgenius"

    aput-object v3, v1, v2

    const/16 v2, 0x1ac

    const-string v4, "com.smedialink.oneclickroot"

    aput-object v4, v1, v2

    const/16 v2, 0x1ad

    const-string v4, "com.thirdparty.superuser"

    aput-object v4, v1, v2

    const/16 v2, 0x1ae

    const-string v5, "com.topjohnwu.magisk"

    aput-object v5, v1, v2

    const/16 v2, 0x1af

    const-string v5, "com.yellowes.su"

    aput-object v5, v1, v2

    const/16 v2, 0x1b0

    const-string v5, "com.z4mod.z4root"

    aput-object v5, v1, v2

    const/16 v2, 0x1b1

    const-string v5, "com.zachspong.temprootremovejb"

    aput-object v5, v1, v2

    const/16 v2, 0x1b2

    const-string v5, "eu.chainfire.suhide"

    aput-object v5, v1, v2

    const/16 v2, 0x1b3

    const-string v5, "eu.chainfire.supersu"

    aput-object v5, v1, v2

    const/16 v2, 0x1b4

    const-string v5, "eu.chainfire.supersu.pro"

    aput-object v5, v1, v2

    const/16 v2, 0x1b5

    const-string v6, "me.phh.superuser"

    aput-object v6, v1, v2

    const/16 v2, 0x1b6

    aput-object v3, v1, v2

    const/16 v2, 0x1b7

    aput-object v5, v1, v2

    const/16 v2, 0x1b8

    const-string v3, "io.github.huskydg.magisk"

    aput-object v3, v1, v2

    const/16 v2, 0x1b9

    const-string v3, "me.weishu.kernelsu"

    aput-object v3, v1, v2

    const/16 v2, 0x1ba

    const-string v3, "io.github.vvb2060.magisk"

    aput-object v3, v1, v2

    const/16 v2, 0x1bb

    aput-object v4, v1, v2

    const/16 v2, 0x1bc

    const-string v3, "com.samsung.knox.securefolder"

    aput-object v3, v1, v2

    const/16 v2, 0x1bd

    const-string v3, "com.google.android.gms"

    aput-object v3, v1, v2

    const/16 v2, 0x1be

    const-string v4, "com.oasisfeng.island"

    aput-object v4, v1, v2

    const/16 v2, 0x1bf

    const-string v4, "xbr.marcelo.appsparalelo"

    aput-object v4, v1, v2

    const/16 v2, 0x1c0

    const-string v4, "net.typeblog.shelter"

    aput-object v4, v1, v2

    const/16 v2, 0x1c1

    const-string v4, "com.amazon.parentalcontrols"

    aput-object v4, v1, v2

    const/16 v2, 0x1c2

    aput-object v3, v1, v2

    const/16 v2, 0x1c3

    aput-object v3, v1, v2

    const/16 v2, 0x1c4

    const-string v3, "com.google.android.apps.enterprise.dmagent"

    aput-object v3, v1, v2

    const/16 v2, 0x1c5

    const-string v3, "com.vmos.romex"

    aput-object v3, v1, v2

    const/16 v2, 0x1c6

    const-string v3, "com.vmos.vmosservice"

    aput-object v3, v1, v2

    const/16 v2, 0x1c7

    const-string v3, "com.vmos.setting"

    aput-object v3, v1, v2

    const/16 v2, 0x1c8

    const-string v3, "com.vmos.hint"

    aput-object v3, v1, v2

    const/16 v2, 0x1c9

    const-string v3, "com.vmos.recovery"

    aput-object v3, v1, v2

    const/16 v2, 0x1ca

    const-string v3, "vmos.com.file"

    aput-object v3, v1, v2

    const/16 v2, 0x1cb

    const-string v3, "vmos.com.feedback"

    aput-object v3, v1, v2

    const/16 v2, 0x1cc

    const-string v3, "com.vmos.pro.intent"

    aput-object v3, v1, v2

    const/16 v2, 0x1cd

    const-string v3, "com.miui.securitycore"

    aput-object v3, v1, v2

    const/16 v2, 0x1ce

    const-string v3, "com.miui.rom"

    aput-object v3, v1, v2

    const/16 v2, 0x1cf

    const-string v3, "com.miui.analytics"

    aput-object v3, v1, v2

    const/16 v2, 0x1d0

    const-string v3, "com.miui.bugreport"

    aput-object v3, v1, v2

    const/16 v2, 0x1d1

    const-string v3, "com.miui.system"

    aput-object v3, v1, v2

    const/16 v2, 0x1d2

    const-string v3, "com.miui.powerkeeper"

    aput-object v3, v1, v2

    const/16 v2, 0x1d3

    const-string v3, "com.miui.cloudservice"

    aput-object v3, v1, v2

    const/16 v2, 0x1d4

    const-string v3, "com.miui.gallery"

    aput-object v3, v1, v2

    const/16 v2, 0x1d5

    const-string v3, "com.miui.fm"

    aput-object v3, v1, v2

    const/16 v2, 0x1d6

    const-string v3, "com.miui.core"

    aput-object v3, v1, v2

    const/16 v2, 0x1d7

    const-string v3, "com.miui.notes"

    aput-object v3, v1, v2

    const/16 v2, 0x1d8

    const-string v3, "com.miui.touchassistant"

    aput-object v3, v1, v2

    const/16 v2, 0x1d9

    const-string v3, "com.miui.miwallpaper"

    aput-object v3, v1, v2

    const/16 v2, 0x1da

    const-string v3, "com.xiaomi.account"

    aput-object v3, v1, v2

    const/16 v2, 0x1db

    const-string v3, "com.xiaomi.finddevice"

    aput-object v3, v1, v2

    const/16 v2, 0x1dc

    const-string v3, "com.xiaomi.xmsf"

    aput-object v3, v1, v2

    const/16 v2, 0x1dd

    const-string v3, "com.xiaomi.discover"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method private showAlertDialogAndExitApp(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 49
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 50
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v1, "Alert"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 51
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 52
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 53
    new-instance v1, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda0;-><init>(Lcom/test/ageapp/overlay;)V

    const/4 v2, -0x3

    const-string v3, "OK"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 57
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 58
    return-void
.end method


# virtual methods
.method public isDeveloperModeEnabled()Z
    .locals 3

    .line 61
    nop

    .line 62
    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "development_settings_enabled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method synthetic lambda$onCreate$0$com-test-ageapp-overlay()V
    .locals 2

    .line 41
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/test/ageapp/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/test/ageapp/overlay;->startActivity(Landroid/content/Intent;)V

    .line 43
    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->finish()V

    .line 44
    return-void
.end method

.method synthetic lambda$showAlertDialogAndExitApp$1$com-test-ageapp-overlay(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 54
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 55
    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->finish()V

    .line 56
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 26
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    new-instance v0, Lcom/scottyab/rootbeer/RootBeer;

    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/scottyab/rootbeer/RootBeer;-><init>(Landroid/content/Context;)V

    .line 28
    .local v0, "rootBeer":Lcom/scottyab/rootbeer/RootBeer;
    invoke-direct {p0}, Lcom/test/ageapp/overlay;->areBlackListAppsInstalled()Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "harmfulApp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Potentially harmful app \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" has been found on device. Please uninstall this app and try again"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/test/ageapp/overlay;->showAlertDialogAndExitApp(Ljava/lang/String;)V

    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v0}, Lcom/scottyab/rootbeer/RootBeer;->isRooted()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 33
    const-string v2, "This device is rooted. You cannot use this app"

    invoke-direct {p0, v2}, Lcom/test/ageapp/overlay;->showAlertDialogAndExitApp(Ljava/lang/String;)V

    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/test/ageapp/overlay;->isDeveloperModeEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 35
    const-string v2, "Developer Mode is enabled. Please Disable and try again"

    invoke-direct {p0, v2}, Lcom/test/ageapp/overlay;->showAlertDialogAndExitApp(Ljava/lang/String;)V

    goto :goto_0

    .line 36
    :cond_2
    invoke-direct {p0}, Lcom/test/ageapp/overlay;->isEmulator()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 37
    const-string v2, "App is detected to be running in an Emulator or Virtual Machine"

    invoke-direct {p0, v2}, Lcom/test/ageapp/overlay;->showAlertDialogAndExitApp(Ljava/lang/String;)V

    goto :goto_0

    .line 39
    :cond_3
    const-string v2, "Hi, No root detected"

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 40
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda1;-><init>(Lcom/test/ageapp/overlay;)V

    iget v4, p0, Lcom/test/ageapp/overlay;->timeout:I

    int-to-long v4, v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 46
    :goto_0
    return-void
.end method
