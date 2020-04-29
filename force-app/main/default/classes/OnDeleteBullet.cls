public abstract class OnDeleteBullet implements OnBeforeBullet, OnAfterBullet {
  protected Set<SObject> oldSet { get; private set; }
  protected Map<ID, SObject> oldMap { get; private set; }

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
