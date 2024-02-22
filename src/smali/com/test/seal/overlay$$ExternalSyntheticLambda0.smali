.class public final synthetic Lcom/test/seal/overlay$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/test/seal/overlay;


# direct methods
.method public synthetic constructor <init>(Lcom/test/seal/overlay;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/test/seal/overlay$$ExternalSyntheticLambda0;->f$0:Lcom/test/seal/overlay;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/test/seal/overlay$$ExternalSyntheticLambda0;->f$0:Lcom/test/seal/overlay;

    invoke-virtual {v0}, Lcom/test/seal/overlay;->lambda$onCreate$0$com-test-seal-overlay()V

    return-void
.end method
