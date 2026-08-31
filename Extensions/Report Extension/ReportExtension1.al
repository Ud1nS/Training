reportextension 60149 "Draft Sales Invoice Ext" extends "Standard Sales - Draft Invoice"
{
    dataset
    {
        add(Header)
        {
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            addfirst(Options)
            {
                field(SalespersonFilterField; SalespersonFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Code Filter';
                    ToolTip = 'Filter invoices by a specific salesperson.';
                    TableRelation = "Salesperson/Purchaser";
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        if SalespersonFilter <> '' then
            Header.SetRange("Salesperson Code", SalespersonFilter);
    end;

    var
        SalespersonFilter: Code[20];
}