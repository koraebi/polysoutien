import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HelpOverviewComponent } from './help-overview.component';

describe('HelpOverviewComponent', () => {
  let component: HelpOverviewComponent;
  let fixture: ComponentFixture<HelpOverviewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HelpOverviewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HelpOverviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
