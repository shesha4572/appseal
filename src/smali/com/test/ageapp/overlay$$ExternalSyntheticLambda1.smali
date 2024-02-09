.class public final synthetic Lcom/test/ageapp/overlay$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/test/ageapp/overlay;


# direct methods
.method public synthetic constructor <init>(Lcom/test/ageapp/overlay;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda1;->f$0:Lcom/test/ageapp/overlay;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/test/ageapp/overlay$$ExternalSyntheticLambda1;->f$0:Lcom/test/ageapp/overlay;

    invoke-virtual {v0}, Lcom/test/ageapp/overlay;->lambda$onCreate$0$com-test-ageapp-overlay()V

    return-void
.end method
