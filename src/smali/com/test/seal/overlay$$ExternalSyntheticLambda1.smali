.class public final synthetic Lcom/test/seal/overlay$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/test/seal/overlay;


# direct methods
.method public synthetic constructor <init>(Lcom/test/seal/overlay;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/test/seal/overlay$$ExternalSyntheticLambda1;->f$0:Lcom/test/seal/overlay;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lcom/test/seal/overlay$$ExternalSyntheticLambda1;->f$0:Lcom/test/seal/overlay;

    invoke-virtual {v0, p1, p2}, Lcom/test/seal/overlay;->lambda$showAlertDialogAndExitApp$1$com-test-seal-overlay(Landroid/content/DialogInterface;I)V

    return-void
.end method
