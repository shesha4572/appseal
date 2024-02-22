.class public final Lcom/test/seal/ScreenShot;
.super Landroid/app/Application;
.source "ScreenShot.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016J\u0008\u0010\u0005\u001a\u00020\u0004H\u0002\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/test/seal/ScreenShot;",
        "Landroid/app/Application;",
        "()V",
        "onCreate",
        "",
        "registerActivityLifecycle",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private final registerActivityLifecycle()V
    .locals 1

    .line 20
    new-instance v0, Lcom/test/seal/ScreenShot$registerActivityLifecycle$1;

    invoke-direct {v0}, Lcom/test/seal/ScreenShot$registerActivityLifecycle$1;-><init>()V

    check-cast v0, Landroid/app/Application$ActivityLifecycleCallbacks;

    invoke-virtual {p0, v0}, Lcom/test/seal/ScreenShot;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 37
    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .line 13
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 15
    invoke-direct {p0}, Lcom/test/seal/ScreenShot;->registerActivityLifecycle()V

    .line 17
    return-void
.end method
