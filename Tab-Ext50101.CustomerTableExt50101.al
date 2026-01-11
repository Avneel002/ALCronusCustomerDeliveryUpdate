tableextension 50101 CustomerTableExt50101 extends Customer
{
    fields
    {
        field(50100; CustomerCardNewExt; )
        {
            Caption = 'CustomerCardNewExt';
            DataClassification = ToBeClassified;
        }
        field(50101; CustomerCardListNewExt; Text[250])
        {
            Caption = 'CustomerCardListNewExt';
            DataClassification = ToBeClassified;
        }
        field(50102; ""; )
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(50103; ""; )
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
    }
}
