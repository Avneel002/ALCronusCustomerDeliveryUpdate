permissionset 90109 "DELIV-PREFS"
{
    Assignable = true;
    Caption = 'Delivery Preferences';

    Permissions =
        tabledata Customer = R,
        tabledata "Sales Header" = RIMD,
        codeunit "DeliveryPreferenceMgt." = X,
        page "DeliveryPreferencesFactBoxMgt" = X;
}
