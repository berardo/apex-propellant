public abstract class OnDeleteBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> oldSet;
  protected Map<ID, SObject> oldMap;

  @SuppressWarnings('PMD.EmptyStatementBlock')
  private OnDeleteBullet() {
  }
  public OnDeleteBullet(Set<SObject> oldSet) {
    this.oldSet = oldSet;
  }
  public OnDeleteBullet(Map<ID, SObject> oldMap) {
    this.oldMap = oldMap;
  }
  public virtual Boolean canFire(TriggerOperation triggerWhen, Propellant propellant) {
    return triggerWhen == TriggerOperation.BEFORE_DELETE ||
      triggerWhen == TriggerOperation.AFTER_DELETE;
  }
}
