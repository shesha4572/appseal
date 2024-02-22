.class public final Lcom/test/seal/MainActivity;
.super Landroidx/activity/ComponentActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J \u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000cH\u0003J\u0012\u0010\u000f\u001a\u00020\n2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0014R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/test/seal/MainActivity;",
        "Landroidx/activity/ComponentActivity;",
        "()V",
        "ageView",
        "Landroid/widget/TextView;",
        "datePicker",
        "Landroid/widget/DatePicker;",
        "submitButton",
        "Landroid/widget/Button;",
        "getAge",
        "",
        "year",
        "",
        "month",
        "dayOfMonth",
        "onCreate",
        "savedInstanceState",
        "Landroid/os/Bundle;",
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


# instance fields
.field private ageView:Landroid/widget/TextView;

.field private datePicker:Landroid/widget/DatePicker;

.field private submitButton:Landroid/widget/Button;


# direct methods
.method public static synthetic $r8$lambda$Y9ATF_jXoUKQHj8xS4o0VcfXf3A(Lcom/test/seal/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/test/seal/MainActivity;->onCreate$lambda$0(Lcom/test/seal/MainActivity;Landroid/view/View;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/test/seal/MainActivity;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroidx/activity/ComponentActivity;-><init>()V

    return-void
.end method

.method private final getAge(III)V
    .locals 6
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "dayOfMonth"    # I

    .line 35
    const-string v0, "ageView"

    .line 36
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/test/seal/MainActivity;->ageView:Landroid/widget/TextView;

    if-nez v2, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Your Age: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 37
    add-int/lit8 v4, p2, 0x1

    invoke-static {p1, v4, p3}, Ljava/time/LocalDate;->of(III)Ljava/time/LocalDate;

    move-result-object v4

    .line 38
    invoke-static {}, Ljava/time/LocalDate;->now()Ljava/time/LocalDate;

    move-result-object v5

    .line 36
    invoke-static {v4, v5}, Ljava/time/Period;->between(Ljava/time/LocalDate;Ljava/time/LocalDate;)Ljava/time/Period;

    move-result-object v4

    .line 39
    invoke-virtual {v4}, Ljava/time/Period;->getYears()I

    move-result v4

    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 39
    const-string v4, " years old"

    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 41
    :catch_0
    move-exception v2

    .line 42
    .local v2, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/test/seal/MainActivity;->ageView:Landroid/widget/TextView;

    if-nez v3, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v3

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private static final onCreate$lambda$0(Lcom/test/seal/MainActivity;Landroid/view/View;)V
    .locals 5
    .param p0, "this$0"    # Lcom/test/seal/MainActivity;
    .param p1, "it"    # Landroid/view/View;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lcom/test/seal/MainActivity;->datePicker:Landroid/widget/DatePicker;

    const/4 v1, 0x0

    const-string v2, "datePicker"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/DatePicker;->getYear()I

    move-result v0

    iget-object v3, p0, Lcom/test/seal/MainActivity;->datePicker:Landroid/widget/DatePicker;

    if-nez v3, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v1

    :cond_1
    invoke-virtual {v3}, Landroid/widget/DatePicker;->getMonth()I

    move-result v3

    iget-object v4, p0, Lcom/test/seal/MainActivity;->datePicker:Landroid/widget/DatePicker;

    if-nez v4, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v4

    :goto_0
    invoke-virtual {v1}, Landroid/widget/DatePicker;->getDayOfMonth()I

    move-result v1

    invoke-direct {p0, v0, v3, v1}, Lcom/test/seal/MainActivity;->getAge(III)V

    .line 30
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 21
    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    sget v0, Lcom/test/ageapp/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/test/seal/MainActivity;->setContentView(I)V

    .line 23
    sget v0, Lcom/test/ageapp/R$id;->datePicker:I

    invoke-virtual {p0, v0}, Lcom/test/seal/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "findViewById(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/DatePicker;

    iput-object v0, p0, Lcom/test/seal/MainActivity;->datePicker:Landroid/widget/DatePicker;

    .line 24
    sget v0, Lcom/test/ageapp/R$id;->submitButton:I

    invoke-virtual {p0, v0}, Lcom/test/seal/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/test/seal/MainActivity;->submitButton:Landroid/widget/Button;

    .line 25
    sget v0, Lcom/test/ageapp/R$id;->ageView:I

    invoke-virtual {p0, v0}, Lcom/test/seal/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/test/seal/MainActivity;->ageView:Landroid/widget/TextView;

    .line 28
    iget-object v0, p0, Lcom/test/seal/MainActivity;->submitButton:Landroid/widget/Button;

    if-nez v0, :cond_0

    const-string v0, "submitButton"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    new-instance v1, Lcom/test/seal/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/test/seal/MainActivity$$ExternalSyntheticLambda0;-><init>(Lcom/test/seal/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    return-void
.end method
