permissionset 50108 "DELIV-PREFS"
{
    Assignable = true;
    Caption = 'Delivery Preferences', MaxLength = 30;
    Permissions =
        page DeliveryPreferencesFactBoxMgt = X,
        codeunit "DeliveryPreferenceMgt." = X,
        tabledata Customer = R,
        tabledata "Sales Header" = RIMD,
        table "Sales Header Delivery Ext" = X,
        codeunit "Delivery Preference Mgt." = X,
        page "Delivery Preferences FactBox" = X;

}
