public with sharing class Propellant {
  private OnInsertBullet insertBullet;
  private OnUpdateBullet updateBullet;
  private OnDeleteBullet deleteBullet;
  private OnUndeleteBullet undeleteBullet;

  public Propellant(OnInsertBullet bullet) {
    insertBullet = bullet;
  }

  public Propellant(OnUpdateBullet bullet) {
    updateBullet = bullet;
  }

  public Propellant(OnDeleteBullet bullet) {
    deleteBullet = bullet;
  }

  public Propellant(OnUndeleteBullet bullet) {
    undeleteBullet = bullet;
  }

  public void fireOff() {
    if (canFireBeforeInsertBullet()) {
      ((OnBeforeBullet)insertBullet).onBeforeRun();
    } else if (canFireAfterInsertBullet()) {
      ((OnAfterBullet)insertBullet).onAfterRun();
    } else if (canFireBeforeUpdateBullet()) {
      ((OnBeforeBullet)updateBullet).onBeforeRun();
    } else if (canFireAfterUpdateBullet()) {
      ((OnAfterBullet)updateBullet).onAfterRun();
    } else if (canFireBeforeDeleteBullet()) {
      ((OnBeforeBullet)deleteBullet).onBeforeRun();
    } else if (canFireAfterDeleteBullet()) {
      ((OnAfterBullet)deleteBullet).onAfterRun();
    } else if (canFireAfterUndeleteBullet()) {
      ((OnAfterBullet)undeleteBullet).onAfterRun();
    }
  }

  private Boolean canFireBeforeInsertBullet() {
    return Trigger.isExecuting &&
      Trigger.isBefore &&
      Trigger.isInsert &&
      insertBullet != null;
  }
  private Boolean canFireAfterInsertBullet() {
    return Trigger.isExecuting &&
      Trigger.isAfter &&
      Trigger.isInsert &&
      insertBullet != null;
  }
  private Boolean canFireBeforeUpdateBullet() {
    return Trigger.isExecuting &&
      Trigger.isBefore &&
      Trigger.isUpdate &&
      updateBullet != null;
  }
  private Boolean canFireAfterUpdateBullet() {
    return Trigger.isExecuting &&
      Trigger.isAfter &&
      Trigger.isUpdate &&
      updateBullet != null;
  }
  private Boolean canFireBeforeDeleteBullet() {
    return Trigger.isExecuting &&
      Trigger.isBefore &&
      Trigger.isDelete &&
      deleteBullet != null;
  }
  private Boolean canFireAfterDeleteBullet() {
    return Trigger.isExecuting &&
      Trigger.isAfter &&
      Trigger.isDelete &&
      deleteBullet != null;
  }
  private Boolean canFireAfterUndeleteBullet() {
    return Trigger.isExecuting &&
      Trigger.isAfter &&
      Trigger.isUndelete &&
      undeleteBullet != null;
  }
}
